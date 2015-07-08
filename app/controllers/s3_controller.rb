class S3Controller < ApplicationController
  # def sign
  #   options = {path_style: true}
  #   logger.ap params
  #   logger.ap params[:contentType]
  #   headers = {"Content-Type" => 'application/xml', "x-amz-acl" => "public-read-write"}

  #   @url = FOG.put_object_url('media.spoonfull.io.s3.amazonaws.com', "user_uploads/#{params[:objectName]}", 15.minutes.from_now.to_time.to_i, headers, options)

  #   render json: {signedUrl: @url}

  # end
  def sign
    # To avoid file collision, we prepend string to the filename
    filename = "#{SecureRandom.hex(4).to_s}_#{params[:objectName]}"
    content_type ="image/jpeg"
    # Content types
    content_type = "application/pdf" if filename.ends_with?(".pdf")
    content_type = "application/epub+zip" if filename.ends_with?(".epub")
    content_type = "application/x-mobipocket-ebook" if filename.ends_with?(".mobi")


    resource_endpoint = "http://media.spoonfull.io.s3.amazonaws.com/user_uploads/#{params[:user_id]}/#{filename}"
    options = {
      :http_verb => "PUT",
      :date => 1.hours.from_now.to_i,
      :resource => "/media.spoonfull.io/user_uploads/#{params[:user_id]}/#{filename}",
      :content_type => content_type
    }

    url = S3Helper.build_s3_upload_url(resource_endpoint, 'AKIAJGZBZS52GHY7LUMA','ZbiZOn29c/vYfnz7tShmivtJuCLB5n2VCDu8FVXi', options)
    render :json => {:put_url => url, :file_url => resource_endpoint, :content_type => content_type,:signedUrl => url}
  end
end
