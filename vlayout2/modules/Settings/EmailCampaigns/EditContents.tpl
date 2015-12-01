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
	<div class="container-fluid" id="EditEmailCampaignsSetting">
		<div class="widget_header row-fluid">
			<div class="span6"><h3>Email Campaigns Setting</h3></div>
		</div>
		<hr>
		<div class="contents">
			<form id="updatedetails" class="form-horizontal" data-detail-url="{$DETAIL_VIEW_URL}" method="post">
				<table class="table table-bordered equalSplit">
					<thead><tr><th colspan="4" class="blockHeader">Email Campaign Settings</th></tr></thead>
					<tr>
						<td class="fieldLabel medium"><label class="muted pull-right marginRight10px"> <span class="redColor">*</span> Batch</label></td>
						<td class="fieldValue medium">
							<input type="text" data-fieldinfo="" value="{$DATA.batch}" class="input-large nameField" name="batch" id="batch">
						</td>
					</tr>
				</table><br>
				<div class="row-fluid">
					<div class="pull-right">
						<button type="submit" class="btn btn-success saveButton" name="save_emailcampaign_setting"><strong>Save</strong></button>
						<a onclick="javascript:window.history.back();" type="reset" class="cancelLink">Cancel</a></div><div class="clearfix">
					</div>
				</div>
			</form>
		</div>
	</div>
{/strip}
