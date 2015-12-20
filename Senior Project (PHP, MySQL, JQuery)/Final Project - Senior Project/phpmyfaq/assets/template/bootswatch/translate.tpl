<h2>{msgNewTranslationHeader}</h2>

            <p>{msgNewTranslationAddon}</p>

            <header>
                <h3>{msgNewTranslationPane}</h3>
            </header>

            <form id="formValues" action="#" method="post" class="form-horizontal">
                <input type="hidden" name="faqid" id="faqid" value="{writeSourceFaqId}" />
                <input type="hidden" name="faqlanguage" id="faqlanguage" value="{writeTransFaqLanguage}" />
                <input type="hidden" name="rubrik[]" value="{categoryId}">
                <input type="hidden" name="contentlink" id="contentlink" value="http://" />

                <div class="form-group">
                    <label class="col-lg-3 control-label" for="question">{msgNewTranslationQuestion}</label>
                    <div class="col-lg-9">
                        <textarea class="form-control" cols="37" rows="3" name="question" id="question" required="required" {readonly}>{writeSourceTitle}</textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label" for="translated_answer">{msgNewTranslationAnswer}</label>
                    <div class="col-lg-9">
                        <textarea class="form-control" cols="37" rows="10" name="translated_answer" id="translated_answer" required="required">{writeSourceContent}</textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label" for="keywords">{msgNewTranslationKeywords}</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" name="keywords" id="keywords" value="{writeSourceKeywords}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label" for="name">{msgNewTranslationName}</label>
                    <div class="col-lg-9">
                        <input type="text" class="form-control" name="name" id="name" value="{defaultContentName}" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label" for="email">{msgNewTranslationMail}</label>
                    <div class="col-lg-9">
                        <input type="email" class="form-control" name="email" id="email" value="{defaultContentMail}" required>
                    </div>
                </div>

				<div class="form-group">
					<div class="col-lg-offset-3 col-lg-9">
						{captchaFieldset}
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-offset-3 col-lg-9">
						<button class="btn btn-primary" type="submit" id="submitfaq">
							{msgNewTranslationSubmit}
						</button>
					</div>
				</div>
				
            </form>

            <div id="loader"></div>
            <div id="faqs"></div>

            <script type="text/javascript" >
            $(function() {
                $('#submitfaq').click(function() {
                    saveFormValues('savefaq', 'faq');
                });
                $('form#formValues').submit(function() { return false; });
            });
            </script>

            [enableWysiwygEditor]
            <script src="admin/editor/tiny_mce.js?{currentTimestamp}"></script>
            <script type="text/javascript">
                tinyMCE.init({
                    mode : "exact",
                    language : "en",
                    elements : "translated_answer",
                    theme : "advanced",
                    plugins : "fullscreen",
                    theme_advanced_buttons1 : "bold,italic,underline,|,strikethrough,justifyleft,justifycenter,justifyright,justifyfull,bullist,numlist,undo,redo,link,unlink,|,fullscreen",
                    theme_advanced_buttons2 : "",
                    theme_advanced_buttons3 : "",
                    theme_advanced_toolbar_location : "top",
                    theme_advanced_toolbar_align : "left",
                    theme_advanced_statusbar_location : "bottom",
                    use_native_selects : true,
                    entity_encoding : "raw",
                    extended_valid_elements : "code"
                });
            </script>
            [/enableWysiwygEditor]