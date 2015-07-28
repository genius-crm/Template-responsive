* GeniusTheme
*
* @package GeniusTheme
* @author CRMReady - Greenbitweb - OpencrmItalia
* @license Opensource
* @copyright 2015 www.genius-crm.com
* @version Release: 1.0

AUTOMATIC INSTALLATION OF RESPONSIVE TEMPLATE

In order to install GeniusTheme it is necessary to load the ZIP file from Module Manager.
The setup will perform the following steps:

1) Creation of the GeniusTheme module (/modules/GeniusTheme)

2) Copy the file "/includes/runtime/Viewer.php" in "/includes/runtime/Viewer_org.php" (in order to restor the old "/vlayout")

3) Copy the new file "Viewer.php" in "/includes/runtime/Viewer.php" (in order for the system to work with the new "/vlayout2")

4) Copy the new file "Viewer.php" in "/includes/runtime/Viewer_rsp.php" (back-up of the new file in order to make work "/vlayout2")

5) Copy the new theme in "/layouts/vlyaout2/"


Operatively it is possible to choose whether to use ore not the GeniusTheme by activating or deactivating the module (using Module Manager).
The system will automatically replace the following file:
"/includes/runtime/Viewer.php" with "Viewer_rsp.php" or with "Viewer_org.php" and will renominate the folder "/layouts/vlyaout2/".

TO BE NOTED: in order to install new module in the CRM system that include parts of templates (.tpl, .js) it is necessary to deactivate and then reactivate the GeniusTheme module.
Doing so the system will automatically copy the content from "/layouts/vlyaout/ a /layouts/vlyaout2/".
The files that are inside the following folders will be exluded from the copy.

layouts/vlayout/modules/Accounts
layouts/vlayout/modules/Calendar
layouts/vlayout/modules/Campaigns
layouts/vlayout/modules/Contacts
layouts/vlayout/modules/CustomView
layouts/vlayout/modules/Documents
layouts/vlayout/modules/Emails
layouts/vlayout/modules/EmailTemplates
layouts/vlayout/modules/Events
layouts/vlayout/modules/ExtensionStore
layouts/vlayout/modules/Google
layouts/vlayout/modules/HelpDesk
layouts/vlayout/modules/Home
layouts/vlayout/modules/Import
layouts/vlayout/modules/Install
layouts/vlayout/modules/Inventory
layouts/vlayout/modules/Invoice
layouts/vlayout/modules/Leads
layouts/vlayout/modules/MailManager
layouts/vlayout/modules/Migration
layouts/vlayout/modules/Mobile
layouts/vlayout/modules/PBXManager
layouts/vlayout/modules/Portal
layouts/vlayout/modules/Potentials
layouts/vlayout/modules/PriceBooks
layouts/vlayout/modules/Products
layouts/vlayout/modules/Project
layouts/vlayout/modules/PurchaseOrder
layouts/vlayout/modules/Quotes
layouts/vlayout/modules/RecycleBin
layouts/vlayout/modules/Reports
layouts/vlayout/modules/Rss
layouts/vlayout/modules/SalesOrder
layouts/vlayout/modules/Services
layouts/vlayout/modules/SMSNotifier
layouts/vlayout/modules/Users
layouts/vlayout/modules/Vendors
layouts/vlayout/modules/Vtiger
layouts/vlayout/modules/Settings/CronTasks
layouts/vlayout/modules/Settings/Currency
layouts/vlayout/modules/Settings/CustomerPortal
layouts/vlayout/modules/Settings/EmailTemplate
layouts/vlayout/modules/Settings/EmailTemplates
layouts/vlayout/modules/Settings/ExtensionStore
layouts/vlayout/modules/Settings/Groups
layouts/vlayout/modules/Settings/LayoutEditor
layouts/vlayout/modules/Settings/Leads
layouts/vlayout/modules/Settings/LoginHistory
layouts/vlayout/modules/Settings/MailConverter
layouts/vlayout/modules/Settings/MenuEditor
layouts/vlayout/modules/Settings/ModuleManager
layouts/vlayout/modules/Settings/PBXManager
layouts/vlayout/modules/Settings/Picklist
layouts/vlayout/modules/Settings/PickListDependency
layouts/vlayout/modules/Settings/Profiles
layouts/vlayout/modules/Settings/Roles
layouts/vlayout/modules/Settings/SharingAccess
layouts/vlayout/modules/Settings/SMSNotifier
layouts/vlayout/modules/Settings/Vtiger
layouts/vlayout/modules/Settings/Webforms
layouts/vlayout/modules/Settings/Workflows 