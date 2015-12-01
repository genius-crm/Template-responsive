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
	<div class="container-fluid" id="DetailEmailCampaignsSetting">
		<div class="widget_header row-fluid">
			<div class="span6"><h3>Email Campaigns Setting</h3></div>
		</div>
		<hr>
		<div class="contents">
			<div class="row-fluid">
				<div class="pull-right">
					<button type="submit" class="btn editButton" name="edit_emailcampaign_setting" data-url="?module={$MODULE}&parent=Settings&view=EditEmailCampaignSettings">
						<strong>Edit</strong>
					</button>
				</div>
			</div><br>
			<table class="table table-bordered equalSplit">
				<thead><tr><th colspan="4" class="blockHeader">Email Campaign Settings</th></tr></thead>
				<tbody>
					<tr>
						<td class="fieldLabel medium">
							<label class="muted pull-right marginRight10px">Batch</label>
						</td>
						<td class="fieldValue medium">
							<span class="value" data-field-type="salutation">{$DATA.batch}</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
{/strip}
