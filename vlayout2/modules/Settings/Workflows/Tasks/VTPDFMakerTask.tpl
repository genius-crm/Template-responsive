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
{*<script src="modules/com_vtiger_workflow/resources/vtigerwebservices.js" type="text/javascript" charset="utf-8"></script>*}

<script type="text/javascript" charset="utf-8">
var moduleName = '{$entityName}';
var taskStatus = '{$TASK_OBJECT->status}';
var taskPriority = '{$TASK_OBJECT->priority}';
</script>

<div class="row-fluid padding-bottom1per">
    <div class="span2"><font color=red>*</font>{vtranslate('LBL_DOC_TITLE','PDFMaker')}</div>
    <div class="span10"><input type="text" name="title" value="{$TASK_OBJECT->title}" id="task_title" class="form_input"></div>
</div>

<div class="row-fluid padding-bottom1per">
    <div class="span2">{vtranslate('LBL_DOC_DESC','PDFMaker')}</div>
    <textarea name="description" class="span8 fields">{$TASK_OBJECT->description}</textarea>
</div>

<div class="row-fluid padding-bottom1per">
    <div class="span2">{vtranslate('LBL_FLD_NAME','PDFMaker')}</div>
    <div class="span10">
        <select id="task_folder" name="folder" class="chzn-select">
            {html_options  options=$TASK_OBJECT->getFolders() selected=$TASK_OBJECT->folder}
        </select>
        <input type="hidden" id="task_folder_value" value="{$TASK_OBJECT->folder}">
    </div>
</div>

<div class="row-fluid padding-bottom1per">
    <div class="span2">{vtranslate('LBL_PDF_TEMPLATE','PDFMaker')}</div>
    <div class="span10">
        <select id="task_template" name="template" class="chzn-select">
            {html_options  options=$TASK_OBJECT->getTemplates($SOURCE_MODULE) selected=$TASK_OBJECT->template}
        </select>
        <input type="hidden" id="task_folder_value" value="{$TASK_OBJECT->template}">
    </div>
</div>
    
<div class="row-fluid padding-bottom1per">
    <div class="span2">{vtranslate('LBL_PDF_LANGUAGE','PDFMaker')}</div>
    <div class="span10">
        {assign var=LANGUAGES_ARRAY value=$TASK_OBJECT->getLanguages()}
        <select id="task_template_language" name="template_language" class="chzn-select">
            {html_options  options=$LANGUAGES_ARRAY selected=$TASK_OBJECT->template_language}
        </select>
        <input type="hidden" id="template_language_value" value="{$TASK_OBJECT->template_language}">
    </div>
</div>    
{/strip}