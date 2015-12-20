        <section>

            <header>
                <h2>{loginHeader}</h2>
            </header>

            [useSslForLogins]
            <p>
                <a href="{secureloginurl}">{securelogintext}</a>
            </p>
            [/useSslForLogins]

            {loginMessage}

            <form class="form-horizontal" action="{writeLoginPath}" method="post">
                <input type="hidden" name="faqloginaction" value="{faqloginaction}"/>

                <div class="form-group">
                    <label class="col-lg-3 control-label" for="faqusername">{username}</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" name="faqusername" id="faqusername" required="required" autofocus="autofocus">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label" for="faqpassword">{password}</label>
                    <div class="col-lg-9">
                        <input type="password" class="form-control" name="faqpassword" id="faqpassword" required="required">
                        <p class="help-block">{sendPassword}</p>
                    </div>
                </div>
				
				<div class="form-group">
					<div class="col-lg-offset-3 col-lg-9">
					  <div class="checkbox">
						<label>
							<input type="checkbox" id="faqrememberme" name="faqrememberme" value="rememberMe">{rememberMe}
						</label>
					  </div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-lg-offset-3 col-lg-9">
					  <button class="btn btn-primary" type="submit">
                        {loginHeader}
                    </button>
					</div>
				</div>
            </form>

        </section>