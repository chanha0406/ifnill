class BucketController < ApplicationController

    before_action :authenticate_user!, only:[:make_bucket, :support]

    def projectList
        @first_bucket_count=Bucket.where(:state => 0).count
        @second_bucket_count=Bucket.where(:state => 1).count
        @final_bucket_count=Bucket.where(:state => 2).count
    end
    

    def firstProcessList
        @first_buckets=Bucket.where(:state => 0)
    end
    

    def secondProcessList
        @second_buckets=Bucket.where(:state => 1)
        if @second_buckets.count == 0
            flash[:danger] = "2단계 버킷이 없습니다."
            redirect_to "/bucket/firstProcessList"
        else
        end
    end
    

    def finalProcessList
        @final_buckets=Bucket.where(:state => 2)
        if @final_buckets.count == 0
            flash[:danger] = "3단계 버킷이 없습니다."
            redirect_to "/bucket/firstProcessList"
        else
        end
    end


    def make_bucket

        @name =  params[:main_title_input]

    end	


    def projectdetail
        @selected_bucket=Bucket.find(params[:id])
    end

     def write_comment
        Reply.create(user_id: current_user.id,
                      bucket_id: params[:bucket_id].to_i,
                      context: params[:msg])
        redirect_to :back
    end
    
    def del_comment
        Reply.find(params[:reply_id]).destroy
        redirect_to :back
    end

    def new
        @bucket = Bucket.new
    end
    
    def create_bucket

        item_count=params[:item_count]

        bucket=Bucket.new
        bucket.user_id=current_user.id
        bucket.name=params[:name]
        bucket.intro_simple=params[:intro_simple]
        bucket.intro_detail=params[:intro_detail]

        if (params[:thumbnail]!=nil)
          bucket.thumbnail = params[:thumbnail]
        end

        bucket.start_date=convert_date(params[:start_date])
        bucket.finish_date=convert_date(params[:finish_date])
        bucket.state=0

        if bucket.save

            1.upto(item_count.to_i) do |i|

            item=Item.new
            item.bucket_id=bucket.id
            item.name=params['item_'+i.to_s]
            item.intro=params['item_'+i.to_s+'_intro']
            item.state=0
            item.save
            # 빈칸 걸러내야 함
            end

            flash[:success] =  "성공적으로 저장되었습니다."
            redirect_to "/bucket/projectdetail/#{bucket.id}"
        else
            flash[:danger] = "저장에 실패하였습니다."
            redirect_to :back
        end
    end

    def create_bucket2
        @bucket=Bucket.new(bucket_params)
        @bucket.state = 0
        if @bucket.save
            flash[:success] = "정상적으로 저장되었습니다."
            redirect_to "/"
        else 
            session[:error] = @bucket.errors.full_messages
            redirect_to :back
        end
    end 
    private
        def bucket_params
            params.require(:bucket).permit(:name, :intro_simple, :intro_detail, :start_date, :final_date)
        end

    public
    def convert_date (arg0)
        if arg0 == ""
        else
            date=""
            date_array=arg0.split('/')
            date_array.insert(0,date_array.pop)

            date_array.each do |x|
                date << x
                if date.length!=10
                    date << '-'
                end
            end

            return date
        end
    end

    def convert_date_reverse (arg0)

        date=""
        date_array=arg0.to_s.split('-')
        date_array.push(date_array.shift)

        date_array.each do |x|
            date << x
            if date.length!=10
                date << '/'
            end
        end

        return date

    end


    def modify

        @selected_bucket=Bucket.find(params[:id])
        @start_date=convert_date_reverse(@selected_bucket.start_date)
        @finish_date=convert_date_reverse(@selected_bucket.finish_date)


    end

    def modify_bucket

        item_count=params[:item_count]

        bucket=Bucket.find(params[:id])
        bucket.name=params[:name]
        bucket.intro_simple=params[:intro_simple]
        bucket.intro_detail=params[:intro_detail]

        if (params[:thumbnail]!=nil)
         bucket.thumbnail = params[:thumbnail]
        end

        # if (params[:thumbnail]!=nil)
        #     outfile = FastImage.resize(params[:thumbnail], 500, 500)            
        #     bucket.thumbnail = outfile
        # end
        
        bucket.start_date=convert_date(params[:start_date])
        bucket.finish_date=convert_date(params[:finish_date])

        bucket.save


        bucket.items.where(:state => 0).each do |x|

            x.destroy

        end

        1.upto(item_count.to_i) do |i|

            item=Item.new
            item.bucket_id=bucket.id
            item.name=params['item_'+i.to_s]
            item.intro=params['item_'+i.to_s+'_intro']
            item.state=0
            item.save
            # 빈칸 걸러내야 함
        end

        redirect_to "/bucket/projectdetail/#{bucket.id}"


    end

    def delete_bucket
        one_bucket = Bucket.find(params[:id])
        #state값 받아서 redirect할때 state 값을 기준으로 다른 페이지로 보내자
        if current_user.id == one_bucket.user_id
            one_bucket.destroy
            flash[:success] = "정상적으로 삭제되었습니다."
            redirect_to "/bucket/projectList"
        else
            flash[:danger] = "권한이 없습니다."
            redirect_to :back
        end
    end



    def support


    end

    
end
