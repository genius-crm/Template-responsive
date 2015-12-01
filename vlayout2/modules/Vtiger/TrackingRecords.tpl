{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
*
 ********************************************************************************/
-->*}
{strip}
 {foreach item=EMAILTRACKINGLISTS from=$TRACKING_LISTS}
 <br/>
	<div class="recordlist">
	      <div class="row-fluid">
	      {assign var=TIME_FORMAT value='%H:%M:%S'}
	      {assign var=DATE_FORMAT value='%Y-%m-%d'}
	      {assign var=DATE value=strtotime($EMAILTRACKINGLISTS->get('modifiedtime'))}
	      {assign var=START_TIME value=$DATE|date_format:$TIME_FORMAT}
	      {assign var=START_DATE value=$DATE|date_format:$DATE_FORMAT}
		    <span class="span6">
				    <strong title="{Vtiger_Util_Helper::formatDateTimeIntoDayString("$START_DATE $START_TIME")}">{$EMAILTRACKINGLISTS->get('campaign_name')} at {Vtiger_Util_Helper::formatDateIntoStrings($START_DATE, $START_TIME)}</strong>
		    </span>
	      </div>
	      				
	      <div class="summaryViewEntries">Email Opened:<span>{$EMAILTRACKINGLISTS->get('email_open')}</span></div>
	      {if $EMAILTRACKINGLISTS->get('email_click') neq ''}
	      <div class="summaryViewEntries">Email Click: <span>{$EMAILTRACKINGLISTS->get('email_click')}</span></div>
	      {/if}
	</div>
      
  {/foreach}
   {if $PAGING_MODEL->isNextPageExists()}
            <div class="row-fluid">
                <div class="pull-right">
                    <a href="index.php?module={$MODULE_NAME}&relatedModule=EmailTrackingReport&view=Detail&record={$RECORDID}&mode=showRelatedList&tab_label=Email Campaigns" >{vtranslate('LBL_MORE',$MODULE_NAME)}..</a>
                </div>
            </div>
        {/if}
  
 
{/strip}
