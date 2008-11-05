class FriendSitesController < ApplicationController
  before_filter :load_category

  # GET /friend_sites
  # GET /friend_sites.xml
  def index
    redirect_to(sites_category_path(@category))
    return
#    @friend_sites = @category.friend_sites.find(:all)
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @friend_sites }
#    end
  end

  # GET /friend_sites/1
  # GET /friend_sites/1.xml
  def show
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @friend_site }
    end
  end

  # GET /friend_sites/new
  # GET /friend_sites/new.xml
  def new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @friend_site }
    end
  end

  # GET /friend_sites/1/edit
  def edit
    @friend_site = @category.friend_sites.find(params[:id])
  end

  # POST /friend_sites
  # POST /friend_sites.xml
  def create
    @friend_site = @category.friend_sites.new(params[:friend_site])

    respond_to do |format|
      if @friend_site.save
        flash[:notice] = 'FriendSite was successfully created.'
#        format.html { redirect_to(@friend_site) }
        format.html {redirect_to(sites_category_path(@category))}
        format.xml  { render :xml => @friend_site, :status => :created, :location => @friend_site }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @friend_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /friend_sites/1
  # PUT /friend_sites/1.xml
  def update
    @friend_site = @category.friend_sites.find(params[:id])

    respond_to do |format|
      if @friend_site.update_attributes(params[:friend_site])
        flash[:notice] = 'FriendSite was successfully updated.'
#        format.html { redirect_to(@friend_site) }
       format.html {redirect_to(sites_category_path(@category))}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @friend_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_sites/1
  # DELETE /friend_sites/1.xml
  def destroy
    @friend_site.destroy

    respond_to do |format|
      format.html { redirect_to(sites_category_path(@category)) }
      format.xml  { head :ok }
    end
  end
  
  def load_category
    @friend_site = params[:id] ? FriendSite.find(params[:id]) : FriendSite.new
    @category = SitesCategory.find(params[:sites_category_id]) if params[:sites_category_id]
  end
end
