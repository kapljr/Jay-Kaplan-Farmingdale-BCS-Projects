<h2>{msgQuestion}</h2>

            <div id="questionForm">
                <p>{msgNewQuestion}</p>
            </div>
            <div id="answerForm"></div>
            <div id="answers"></div>

            <form class="form-horizontal" id="formValues" action="#" method="post">
                <input type="hidden" name="lang" id="lang" value="{lang}" />

                <div class="form-group">
                    <label class="col-lg-3 control-label" for="name">{msgNewContentName}</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" name="name" id="name" value="{defaultContentName}" required="required" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label" for="email">{msgNewContentMail}</label>
                    <div class="col-lg-9">
                        <input type="email" class="form-control" name="email" id="email" value="{defaultContentMail}" required="required" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label" for="category">{msgAskCategory}</label>
                    <div class="col-lg-9">
                        <select class="form-control" name="category" id="category" required="required" />
                        {printCategoryOptions}
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label" for="question">{msgAskYourQuestion}</label>
                    <div class="col-lg-9">
                        <textarea class="form-control" cols="45" rows="5" name="question" id="question" required="required" /></textarea>
                    </div>
                </div>
				
				<div class="form-group">
					<div class="col-lg-offset-3 col-lg-9">
						{captchaFieldset}
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-offset-3 col-lg-9">
						<div id="loader"></div>
						<div id="qerror"></div>
					</div>
				</div>
				
                <div class="form-group">
					<div class="col-lg-offset-3 col-lg-9">
						<button class="btn btn-primary" type="submit" id="submitquestion">
							{msgNewContentSubmit}
						</button>
					</div>
				</div>

            </form>

            <script type="text/javascript" >
            $(function() {
                $('#submitquestion').click(function() {
                    checkQuestion();
                });
                $('form#formValues').submit(function() { return false; });
            });
            </script>