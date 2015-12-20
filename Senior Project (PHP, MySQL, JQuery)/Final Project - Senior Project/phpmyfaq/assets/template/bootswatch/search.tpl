<section>
            <header>
                <h2>{msgAdvancedSearch}</h2>
            </header>
    
            {printResult}
            
            <div class="well" id="searchBox">
            <form action="{writeSendAdress}" method="get" class="form-search">
				<div class="input-group">
					<input type="search" class="form-control" name="search" id="searchfield" value="{searchString}" autofocus>
					<span class="input-group-btn">
						<button class="btn btn-primary" type="submit" name="submit">{msgSearch}</button>
					</span>
				</div><!-- /input-group -->		
                <div class="form-group">
                    <label class="checkbox inline">
                    <input type="checkbox"{checkedAllLanguages} name="langs" id="langs" value="all" />
                     {searchOnAllLanguages}
                    </label>
                </div>		
				<div class="form-group">
                    <label class="control-label">{selectCategories}</label>
					<select class="form-control" name="searchcategory" size="1">
					<option value="%" selected="selected">{allCategories}</option>
					{printCategoryOptions}
					</select>

                </div>
                <div class="form-group pull-right">
                    <small>{openSearchLink}</small>
                </div>
				<div class="form-group">
                <small>&nbsp;</small></div>
            </form>
            </div>
                
                <p id="mostpopularsearches">
                    <h4>{msgMostPopularSearches}</h4>
                    {printMostPopularSearches}
                </p>

        </section>