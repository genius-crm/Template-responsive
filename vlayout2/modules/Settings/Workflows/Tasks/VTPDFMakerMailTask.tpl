{*<!--
/* * *******************************************************************************
 * The content of this file is subject to the PDF Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{strip}
<div id="VtEmailTaskContainer">
    <div class="contents tabbable ui-sortable">
        <ul class="nav nav-tabs layoutTabs massEditTabs">
            <li class="active">
                <a data-toggle="tab" href="#detailViewLayout" id="detailViewLayoutBtn"><strong>{vtranslate('LBL_EMAIL_DETAILS','PDFMaker')}</strong></a>
            </li>
            <li class="relatedListTab">
                <a data-toggle="tab" href="#relatedTabTemplate" class="workflowTab"><strong>{vtranslate('LBL_PDF_TEMPLATE','PDFMaker')}</strong></a>
            </li>
            <li class="relatedListTab">
                <a data-toggle="tab" href="#relatedTabContent" class="workflowTab"><strong>{vtranslate('LBL_EMAIL_CONTENT','PDFMaker')}</strong></a>
            </li>
        </ul>
        <div class="tab-content layoutContent padding20 themeTableColor overflowVisible">
            <div class="tab-pane active" id="detailViewLayout">
                <div class="row-fluid padding-bottom1per">
                    <span class="span7 row-fluid">
                        <span class="span2">{vtranslate('LBL_FROM', $QUALIFIED_MODULE)|ucfirst}</span>
                        <input data-validation-engine='validate[]' name="fromEmail" class="span9 fields" type="text" value="{$TASK_OBJECT->fromEmail}" />
                    </span>
                    <span class="span5">
                        <select id="fromEmailOption" style="min-width: 300px" class="chzn-select" data-placeholder={vtranslate('LBL_SELECT_OPTIONS',$QUALIFIED_MODULE)}>
                            <option></option>
                            {$FROM_EMAIL_FIELD_OPTION}
                        </select>
                    </span>
                </div>
                <div class="row-fluid padding-bottom1per">
                    <span class="span7 row-fluid">
                        <span class="span2">{vtranslate('LBL_TO',$QUALIFIED_MODULE)|ucfirst}<span class="redColor">*</span></span>
                        <input data-validation-engine='validate[required]' name="recepient" class="span9 fields" type="text" value="{$TASK_OBJECT->recepient}" />
                    </span>
                    <span class="span5">
                        <select style="min-width: 300px" class="task-fields chzn-select" data-placeholder={vtranslate('LBL_SELECT_OPTIONS',$QUALIFIED_MODULE)}>
                            <option></option>
                            {$EMAIL_FIELD_OPTION}
                        </select>
                    </span>
                </div>
                <div class="row-fluid padding-bottom1per {if empty($TASK_OBJECT->emailcc)}hide {/if}" id="ccContainer">
                    <span class="span7 row-fluid">
                        <span class="span2">{vtranslate('LBL_CC',$QUALIFIED_MODULE)}</span>
                        <input class="span9 fields" type="text" name="emailcc" value="{$TASK_OBJECT->emailcc}" />
                    </span>
                    <span class="span5">
                        <select class="task-fields" data-placeholder='{vtranslate('LBL_SELECT_OPTIONS',$QUALIFIED_MODULE)}' style="min-width: 300px">
                            <option></option>
                            {$EMAIL_FIELD_OPTION}
                        </select>
                    </span>
                </div>
                <div class="row-fluid padding-bottom1per {if empty($TASK_OBJECT->emailbcc)}hide {/if}" id="bccContainer">
                    <span class="span7 row-fluid">
                        <span class="span2">{vtranslate('LBL_BCC',$QUALIFIED_MODULE)}</span>
                        <input class="span9 fields" type="text" name="emailbcc" value="{$TASK_OBJECT->emailbcc}" />
                    </span>
                    <span class="span5">
                        <select class="task-fields" data-placeholder='{vtranslate('LBL_SELECT_OPTIONS',$QUALIFIED_MODULE)}' style="min-width: 300px">
                            <option></option>
                            {$EMAIL_FIELD_OPTION}
                        </select>
                    </span>
                </div>
                <div class="row-fluid padding-bottom1per {if (!empty($TASK_OBJECT->emailcc)) and (!empty($TASK_OBJECT->emailbcc))} hide {/if}">
                    <span class="span8 row-fluid">
                        <span class="span2">&nbsp;</span>
                        <span class="span9">
                            <a class="cursorPointer {if (!empty($TASK_OBJECT->emailcc))}hide{/if}" id="ccLink">{vtranslate('LBL_ADD_CC',$QUALIFIED_MODULE)}</a>&nbsp;&nbsp;
                            <a class="cursorPointer {if (!empty($TASK_OBJECT->emailbcc))}hide{/if}" id="bccLink">{vtranslate('LBL_ADD_BCC',$QUALIFIED_MODULE)}</a>
                        </span>
                    </span>
                </div>
                <div class="row-fluid padding-bottom1per">
                    <span class="span7 row-fluid">
                        <span class="span2">{vtranslate('LBL_SUBJECT',$QUALIFIED_MODULE)}<span class="redColor">*</span></span>
                        <input data-validation-engine='validate[required]' name="subject" class="span9 fields" type="text" name="subject" value="{$TASK_OBJECT->subject}" id="subject"/>
                    </span>
                    <span class="span5">
                        <select style="min-width: 300px" class="task-fields chzn-select" data-placeholder={vtranslate('LBL_SELECT_OPTIONS',$QUALIFIED_MODULE)}>
                            <option></option>
                            {$ALL_FIELD_OPTIONS}
                        </select>
                    </span>
                </div>
            </div>
            <div class="tab-pane" id="relatedTabTemplate">
                <div class="row-fluid padding-bottom1per">
                    <span class="span12 row-fluid">
                        <span style="margin-top: 7px" class="span2">{vtranslate('LBL_PDF_TEMPLATE','PDFMaker')}</span>&nbsp;&nbsp;
                        <span class="span8">
                            <select multiple id="task_template" name="template" class="span7 chzn-select">
                                {html_options  options=$TASK_OBJECT->getTemplates($SOURCE_MODULE) selected=$TASK_OBJECT->template}
                            </select>
                            <input type="hidden" id="task_folder_value" value="{$TASK_OBJECT->template}">
                        </span>	
                    </span>
                </div>
                <div class="row-fluid padding-bottom1per">    
                    <span class="span12 row-fluid">
                        <span style="margin-top: 7px" class="span2">{vtranslate('LBL_PDF_LANGUAGE','PDFMaker')}</span>&nbsp;&nbsp;
                        <span class="span8">
                            {assign var=LANGUAGES_ARRAY value=$TASK_OBJECT->getLanguages()}
                            <select style="min-width: 215px" id="task_template_language" name="template_language" class="chzn-select">
                                {html_options  options=$LANGUAGES_ARRAY selected=$TASK_OBJECT->template_language}
                            </select>
                            <input type="hidden" id="template_language_value" value="{$TASK_OBJECT->template_language}">
                        </span>	
                    </span>
                </div>  
            </div>
            <div class="tab-pane" id="relatedTabContent">
                <div class="row-fluid padding-bottom1per">
                    <span class="span7 row-fluid">
                        <span style="margin-top: 7px" class="span2">{vtranslate('LBL_ADD_FIELD',$QUALIFIED_MODULE)}</span>&nbsp;&nbsp;
                        <span class="span8">
                            <select style="min-width: 250px" id="task-fieldnames" class="chzn-select" data-placeholder={vtranslate('LBL_SELECT_OPTIONS',$QUALIFIED_MODULE)}>
                                    <option></option>
                                    {$ALL_FIELD_OPTIONS}
                            </select>
                        </span>	
                    </span>
                    <span class="span5 row-fluid">
                        <span style="margin-top: 7px" class="span3">{vtranslate('LBL_ADD_TIME',$QUALIFIED_MODULE)}</span>&nbsp;&nbsp;
                        <span class="span8">
                            <select style="width: 215px" id="task_timefields" class="chzn-select" data-placeholder={vtranslate('LBL_SELECT_OPTIONS',$QUALIFIED_MODULE)}>
                                <option></option>
                                {foreach from=$META_VARIABLES item=META_VARIABLE_KEY key=META_VARIABLE_VALUE}
                                        <option value="${$META_VARIABLE_KEY}">{vtranslate($META_VARIABLE_VALUE,$QUALIFIED_MODULE)}</option>
                                {/foreach}	
                            </select>
                        </span>	
                    </span>
                </div>
                <div class="row-fluid padding-bottom1per">
                    <textarea id="content" name="content">{$TASK_OBJECT->content}</textarea>
                </div>
            </div>
        </div> 
    </div>
</div>	
{*<script src="layouts/vlayout/modules/Vtiger/resources/CkEditor.js" type="text/javascript" charset="utf-8"></script>*}
<script src="modules/PDFMaker/workflow/VTPDFMakerMailTask.js" type="text/javascript" charset="utf-8"></script>  
<script type="text/javascript">
    Settings_Workflows_Edit_Js.prototype.registerVTPDFMakerMailTaskEvents = function () {
        var textAreaElement = jQuery('#content');
        var ckEditorInstance = this.getckEditorInstance();
        ckEditorInstance.loadCkEditor(textAreaElement);
        this.registerFillMailContentEvent();
        this.registerFillTaskFromEmailFieldEvent();
        this.registerCcAndBccEvents();
    };
    
    Settings_Workflows_Edit_Js.prototype.VTPDFMakerMailTaskCustomValidation = function () {
        var result = true;
        
        var selectElement1 = jQuery('input[name="recepient"]');
        var control1 = selectElement1.val();

        var selectElement2 = jQuery('input[name="subject"]');
        var control2 = selectElement2.val();

        if(control1 == "" || control2 == "") {
            jQuery('#detailViewLayoutBtn').trigger('click');
            var result = app.vtranslate('JS_REQUIRED_FIELD');
        }         
        
        return result;
    };
</script>
{/strip}	