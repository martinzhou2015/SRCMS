<?php
    if(C('LAYOUT_ON')) {
        echo '{__NOLAYOUT__}';
    }
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>系统发生错误</title>
<link href="//cdn.bootcss.com/bootstrap/4.0.0-alpha.5/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
*{ padding: 0; margin: 0; }
html{ overflow-y: scroll; }
body{ background: #fff; font-family: '微软雅黑'; color: #333; font-size: 16px; }
img{ border: 0; }
.error{ padding: 24px 48px; }
.face{ font-size: 100px; font-weight: normal; line-height: 120px; margin-bottom: 12px; }
h1{ font-size: 32px; line-height: 48px; }
.error .content{ padding-top: 10px}
.error .info{ margin-bottom: 12px; }
.error .info .title{ margin-bottom: 3px; }
.error .info .title h3{ color: #000; font-weight: 700; font-size: 16px; }
.error .info .text{ line-height: 24px; }
.copyright{ padding: 12px 48px; color: #999; }
.copyright a{ color: #000; text-decoration: none; }

.bd-booticon {
  display: block;
  width: 9rem;
  height: 9rem;
  font-size: 6.5rem;
  line-height: 9rem;
  color: #fff;
  text-align: center;
  cursor: default;
  background-color: #563d7c;
  border-radius: 15%;
}

.bd-booticon.inverse {
  color: #563d7c;
  background-color: #fff;
}

.bd-booticon.outline {
  background-color: transparent;
  border: 1px solid #cdbfe3;
}

.bd-navbar {
  padding-right: 0;
  padding-left: 0;
}

.bd-navbar .navbar-nav .nav-link {
  color: #8e869d;
}

.bd-navbar .navbar-nav .nav-link.active, .bd-navbar .navbar-nav .nav-link:hover, .bd-navbar .navbar-nav .nav-link:focus {
  color: #373a3c;
  background-color: transparent;
}

.bd-navbar .navbar-nav .nav-link.active {
  font-weight: 500;
  color: #121314;
}

.bd-navbar .dropdown-menu {
  font-size: inherit;
}

@media (max-width: 767px) {
  .bd-navbar .nav-link {
    float: none;
  }
  .bd-navbar .nav-link + .nav-link {
    margin-left: 0;
  }
}

.bd-masthead {
  position: relative;
  padding: 3rem 15px 2rem;
  color: #cdbfe3;
  text-align: center;
  background-image: -webkit-linear-gradient(315deg, #271b38, #563d7c, #7952b3);
  background-image: -o-linear-gradient(315deg, #271b38, #563d7c, #7952b3);
  background-image: linear-gradient(135deg, #271b38, #563d7c, #7952b3);
}

.bd-masthead .bd-booticon {
  margin: 0 auto 2rem;
  color: #cdbfe3;
  border-color: #cdbfe3;
}

.bd-masthead h1 {
  font-weight: 300;
  line-height: 1;
}

.bd-masthead .lead {
  margin-right: auto;
  margin-bottom: 2rem;
  margin-left: auto;
  font-size: 1.25rem;
  color: #fff;
}

.bd-masthead .version {
  margin-top: -1rem;
  margin-bottom: 2rem;
}

.bd-masthead .btn {
  width: 100%;
  padding: 1rem 2rem;
  font-size: 1.25rem;
  font-weight: 500;
  color: #ffe484;
  border-color: #ffe484;
}

.bd-masthead .btn:hover {
  color: #2a2730;
  background-color: #ffe484;
  border-color: #ffe484;
}

.bd-masthead .carbonad {
  margin-bottom: -2rem !important;
}

@media (min-width: 576px) {
  .bd-masthead {
    padding-top: 8rem;
    padding-bottom: 2rem;
  }
  .bd-masthead .btn {
    width: auto;
  }
  .bd-masthead .carbonad {
    margin-bottom: 0 !important;
  }
}

@media (min-width: 768px) {
  .bd-masthead {
    padding-bottom: 4rem;
  }
  .bd-masthead .bd-header {
    margin-bottom: 4rem;
  }
  .bd-masthead h1 {
    font-size: 4rem;
  }
  .bd-masthead .lead {
    font-size: 1.5rem;
  }
  .bd-masthead .carbonad {
    margin-top: 3rem !important;
  }
}

@media (min-width: 992px) {
  .bd-masthead .lead {
    width: 85%;
    font-size: 2rem;
  }
}

.bd-featurette {
  padding-top: 3rem;
  padding-bottom: 3rem;
  font-size: 1rem;
  line-height: 1.5;
  color: #555;
  text-align: center;
  background-color: #fff;
  border-top: 1px solid #eee;
}

.bd-featurette .highlight {
  text-align: left;
}

.bd-featurette .lead {
  margin-right: auto;
  margin-bottom: 2rem;
  margin-left: auto;
  font-size: 1rem;
  text-align: center;
}

@media (min-width: 576px) {
  .bd-featurette {
    text-align: left;
  }
}

@media (min-width: 768px) {
  .bd-featurette .col-sm-6:first-child {
    padding-right: 45px;
  }
  .bd-featurette .col-sm-6:last-child {
    padding-left: 45px;
  }
}

.bd-featurette-title {
  margin-bottom: .5rem;
  font-size: 2rem;
  font-weight: normal;
  color: #333;
  text-align: center;
}

.half-rule {
  width: 6rem;
  margin: 2.5rem auto;
}

@media (min-width: 576px) {
  .half-rule {
    margin-right: 0;
    margin-left: 0;
  }
}

.bd-featurette h4 {
  margin-top: 1rem;
  margin-bottom: .5rem;
  font-weight: normal;
  color: #333;
}

.bd-featurette-img {
  display: block;
  margin-bottom: 1.25rem;
  color: #333;
}

.bd-featurette-img:hover {
  color: #0275d8;
  text-decoration: none;
}

.bd-featurette-img img {
  display: block;
  margin-bottom: 1rem;
}

@media (min-width: 480px) {
  .bd-featurette .img-fluid {
    margin-top: 2rem;
  }
}

@media (min-width: 768px) {
  .bd-featurette {
    padding-top: 6rem;
    padding-bottom: 6rem;
  }
  .bd-featurette-title {
    font-size: 2.5rem;
  }
  .bd-featurette-title + .lead {
    font-size: 1.5rem;
  }
  .bd-featurette .lead {
    max-width: 80%;
  }
  .bd-featurette .img-fluid {
    margin-top: 0;
  }
}

.bd-featured-sites {
  margin-right: -1px;
  margin-left: -1px;
}

.bd-featured-sites .col-xs-6 {
  padding: 1px;
}

.bd-featured-sites .img-fluid {
  margin-top: 0;
}

@media (min-width: 768px) {
  .bd-featured-sites .col-sm-3:first-child img {
    border-top-left-radius: .25rem;
    border-bottom-left-radius: .25rem;
  }
  .bd-featured-sites .col-sm-3:last-child img {
    border-top-right-radius: .25rem;
    border-bottom-right-radius: .25rem;
  }
}

#carbonads {
  display: block;
  padding: 15px 15px 15px 160px;
  margin: 50px -15px 0;
  overflow: hidden;
  font-size: 13px;
  line-height: 1.5;
  text-align: left;
  border: solid #866ab3;
  border-width: 1px 0 0;
}

#carbonads a {
  color: #fff;
  text-decoration: none;
}

@media (min-width: 576px) {
  #carbonads {
    max-width: 330px;
    margin: 50px auto 0;
    border-width: 1px;
    border-radius: 4px;
  }
}

@media (min-width: 992px) {
  #carbonads {
    position: absolute;
    top: 0;
    right: 15px;
    margin-top: 0;
  }
  .bd-masthead #carbonads {
    position: static;
  }
}

.carbon-img {
  float: left;
  margin-left: -145px;
}

.carbon-poweredby {
  display: block;
  color: #cdbfe3 !important;
}

.bd-content > table {
  display: block;
  width: 100%;
  max-width: 100%;
  margin-bottom: 1rem;
  overflow-y: auto;
}

.bd-content > table > thead > tr > th,
.bd-content > table > thead > tr > td,
.bd-content > table > tbody > tr > th,
.bd-content > table > tbody > tr > td,
.bd-content > table > tfoot > tr > th,
.bd-content > table > tfoot > tr > td {
  padding: 0.75rem;
  vertical-align: top;
  border: 1px solid #eceeef;
}

.bd-content > table > thead > tr > th > p:last-child,
.bd-content > table > thead > tr > td > p:last-child,
.bd-content > table > tbody > tr > th > p:last-child,
.bd-content > table > tbody > tr > td > p:last-child,
.bd-content > table > tfoot > tr > th > p:last-child,
.bd-content > table > tfoot > tr > td > p:last-child {
  margin-bottom: 0;
}

.bd-content > table td:first-child > code {
  white-space: nowrap;
}

.bd-content > h2:not(:first-child) {
  margin-top: 3rem;
}

.bd-content > h3 {
  margin-top: 1.5rem;
}

.bd-content > ul li,
.bd-content > ol li {
  margin-bottom: .25rem;
}

@media (min-width: 576px) {
  .bd-title {
    font-size: 3rem;
  }
  .bd-title + p {
    font-size: 1.25rem;
    font-weight: 300;
  }
}

#markdown-toc > li:first-child {
  display: none;
}

#markdown-toc ul {
  padding-left: 2rem;
  margin-top: .25rem;
  margin-bottom: .25rem;
}

.bd-pageheader {
  padding: 2rem 15px;
  margin-bottom: 1.5rem;
  color: #cdbfe3;
  text-align: center;
  background-color: #563d7c;
}

.bd-pageheader .container {
  position: relative;
}

.bd-pageheader h1 {
  font-size: 3rem;
  font-weight: normal;
  color: #fff;
}

.bd-pageheader p {
  margin-bottom: 0;
  font-size: 1.25rem;
  font-weight: 300;
}

@media (min-width: 576px) {
  .bd-pageheader {
    padding-top: 4rem;
    padding-bottom: 4rem;
    margin-bottom: 3rem;
    text-align: left;
  }
  .bd-pageheader .carbonad {
    margin: 2rem 0 0 !important;
  }
}

@media (min-width: 768px) {
  .bd-pageheader h1 {
    font-size: 4rem;
  }
  .bd-pageheader p {
    font-size: 1.5rem;
  }
}

@media (min-width: 992px) {
  .bd-pageheader h1,
  .bd-pageheader p {
    margin-right: 380px;
  }
  .bd-pageheader .carbonad {
    position: absolute;
    top: 0;
    right: .75rem;
    margin: 0 !important;
  }
}

#skippy {
  display: block;
  padding: 1em;
  color: #fff;
  background-color: #563d7c;
  outline: 0;
}

#skippy .skiplink-text {
  padding: .5em;
  outline: 1px dotted;
}

@media (min-width: 768px) {
  .bd-sidebar {
    padding-left: 1rem;
  }
}

.bd-search {
  position: relative;
  margin-bottom: 1.5rem;
}

.bd-search .form-control {
  height: 2.45rem;
  padding-top: .4rem;
  padding-bottom: .4rem;
  background-color: #fafafa;
}

.bd-search .form-control:focus {
  background-color: #fff;
}

.bd-search-results {
  right: 0;
  display: block;
  padding: 0;
  overflow: hidden;
  font-size: .9rem;
}

.bd-search-results:empty {
  display: none;
}

.bd-search-results .dropdown-item {
  padding-right: .75rem;
  padding-left: .75rem;
}

.bd-search-results .dropdown-item:first-child {
  margin-top: .25rem;
}

.bd-search-results .dropdown-item:last-child {
  margin-bottom: .25rem;
}

.bd-search-results .no-results {
  padding: .75rem 1rem;
  color: #7a7a7a;
  text-align: center;
  white-space: normal;
}

.bd-sidenav {
  display: none;
}

.bd-toc-link {
  display: block;
  padding: .25rem .75rem;
  color: #55595c;
}

.bd-toc-link:hover,
.bd-toc-link:focus {
  color: #0275d8;
  text-decoration: none;
}

.active > .bd-toc-link {
  font-weight: 500;
  color: #373a3c;
}

.active > .bd-sidenav {
  display: block;
}

.bd-toc-item.active {
  margin-top: 1rem;
  margin-bottom: 1rem;
}

.bd-toc-item:first-child {
  margin-top: 0;
}

.bd-toc-item:last-child {
  margin-bottom: 2rem;
}

.bd-sidebar .nav > li > a {
  display: block;
  padding: .25rem .75rem;
  font-size: 90%;
  color: #99979c;
}

.bd-sidebar .nav > li > a:hover,
.bd-sidebar .nav > li > a:focus {
  color: #0275d8;
  text-decoration: none;
  background-color: transparent;
}

.bd-sidebar .nav > .active > a,
.bd-sidebar .nav > .active:hover > a,
.bd-sidebar .nav > .active:focus > a {
  font-weight: 500;
  color: #373a3c;
  background-color: transparent;
}

.bd-footer {
  padding: 4rem 0;
  margin-top: 4rem;
  font-size: 85%;
  text-align: center;
  background-color: #f7f7f7;
}

.bd-footer a {
  font-weight: 500;
  color: #55595c;
}

.bd-footer a:hover {
  color: #0275d8;
}

.bd-footer p {
  margin-bottom: 0;
}

@media (min-width: 576px) {
  .bd-footer {
    text-align: left;
  }
}

.bd-footer-links {
  padding-left: 0;
  margin-bottom: 1rem;
}

.bd-footer-links li {
  display: inline-block;
}

.bd-footer-links li + li {
  margin-left: 1rem;
}

.bd-example-row .row + .row {
  margin-top: 1rem;
}

.bd-example-row .row > .col,
.bd-example-row .row > [class^="col-"] {
  padding-top: .75rem;
  padding-bottom: .75rem;
  background-color: rgba(86, 61, 124, 0.15);
  border: 1px solid rgba(86, 61, 124, 0.2);
}

.bd-example-row .flex-items-xs-top,
.bd-example-row .flex-items-xs-middle,
.bd-example-row .flex-items-xs-bottom {
  min-height: 6rem;
  background-color: rgba(255, 0, 0, 0.1);
}

.bd-example-row-flex-cols .row {
  min-height: 10rem;
  background-color: rgba(255, 0, 0, 0.1);
}

.bd-example-container {
  min-width: 16rem;
  max-width: 25rem;
  margin-right: auto;
  margin-left: auto;
}

.bd-example-container-header {
  height: 3rem;
  margin-bottom: .5rem;
  background-color: #daeeff;
  border-radius: .25rem;
}

.bd-example-container-sidebar {
  float: right;
  width: 4rem;
  height: 8rem;
  background-color: #fae3c4;
  border-radius: .25rem;
}

.bd-example-container-body {
  height: 8rem;
  margin-right: 4.5rem;
  background-color: #957bbe;
  border-radius: .25rem;
}

.bd-example-container-fluid {
  max-width: none;
}

.bd-example {
  position: relative;
  padding: 1rem;
  margin: 1rem -1rem;
  border: solid #f7f7f9;
  border-width: .2rem 0 0;
}

.bd-example::after {
  content: "";
  display: table;
  clear: both;
}

@media (min-width: 576px) {
  .bd-example {
    padding: 1.5rem;
    margin-right: 0;
    margin-bottom: 0;
    margin-left: 0;
    border-width: .2rem;
  }
}

.bd-example + .highlight,
.bd-example + .clipboard + .highlight {
  margin-top: 0;
}

.bd-example + p {
  margin-top: 2rem;
}

.bd-example .container {
  width: auto;
}

.bd-example > .form-control + .form-control {
  margin-top: .5rem;
}

.bd-example > .card {
  max-width: 20rem;
}

.bd-example > .nav + .nav,
.bd-example > .alert + .alert,
.bd-example > .navbar + .navbar,
.bd-example > .progress + .progress,
.bd-example > .progress + .btn {
  margin-top: 1rem;
}

.bd-example > .dropdown-menu:first-child {
  position: static;
  display: block;
}

.bd-example > .form-group:last-child {
  margin-bottom: 0;
}

.bd-example > .close {
  float: none;
}

.bd-example-type .table .type-info {
  color: #999;
  vertical-align: middle;
}

.bd-example-type .table td {
  padding: 1rem 0;
  border-color: #eee;
}

.bd-example-type .table tr:first-child td {
  border-top: 0;
}

.bd-example-type h1,
.bd-example-type h2,
.bd-example-type h3,
.bd-example-type h4,
.bd-example-type h5,
.bd-example-type h6 {
  margin: 0;
}

.bd-example-bg-classes p {
  padding: 1rem;
}

.bd-example > img + img {
  margin-left: .5rem;
}

.bd-example > .btn-group {
  margin-top: .25rem;
  margin-bottom: .25rem;
}

.bd-example > .btn-toolbar + .btn-toolbar {
  margin-top: .5rem;
}

.bd-example-control-sizing select,
.bd-example-control-sizing input[type="text"] + input[type="text"] {
  margin-top: .5rem;
}

.bd-example-form .input-group {
  margin-bottom: .5rem;
}

.bd-example > textarea.form-control {
  resize: vertical;
}

.bd-example > .list-group {
  max-width: 400px;
}

.bd-example .navbar-fixed-top {
  position: static;
  margin: -1rem -1rem 1rem;
}

.bd-example .navbar-fixed-bottom {
  position: static;
  margin: 1rem -1rem -1rem;
}

@media (min-width: 576px) {
  .bd-example .navbar-fixed-top {
    margin: -1.5rem -1.5rem 1rem;
  }
  .bd-example .navbar-fixed-bottom {
    margin: 1rem -1.5rem -1.5rem;
  }
}

.bd-example .pagination {
  margin-top: .5rem;
  margin-bottom: .5rem;
}

.bd-example-modal {
  background-color: #f5f5f5;
}

.bd-example-modal .modal {
  position: relative;
  top: auto;
  right: auto;
  bottom: auto;
  left: auto;
  z-index: 1;
  display: block;
}

.bd-example-modal .modal-dialog {
  left: auto;
  margin-right: auto;
  margin-left: auto;
}

.bd-example > .dropdown > .dropdown-toggle {
  float: left;
}

.bd-example > .dropdown > .dropdown-menu {
  position: static;
  display: block;
  margin-bottom: .25rem;
  clear: left;
}

.bd-example-tabs .nav-tabs {
  margin-bottom: 1rem;
}

.bd-example-tooltips {
  text-align: center;
}

.bd-example-tooltips > .btn {
  margin-top: .25rem;
  margin-bottom: .25rem;
}

.bd-example-popover-static {
  padding-bottom: 1.5rem;
  background-color: #f9f9f9;
}

.bd-example-popover-static .popover {
  position: relative;
  display: block;
  float: left;
  width: 260px;
  margin: 1.25rem;
}

.tooltip-demo a {
  white-space: nowrap;
}

.bd-example-tooltip-static .tooltip {
  position: relative;
  display: inline-block;
  margin: 10px 20px;
  opacity: 1;
}

.scrollspy-example {
  position: relative;
  height: 200px;
  margin-top: .5rem;
  overflow: auto;
}

.bd-example > .bg-primary:not(.navbar),
.bd-example > .bg-success:not(.navbar),
.bd-example > .bg-info:not(.navbar),
.bd-example > .bg-warning:not(.navbar),
.bd-example > .bg-danger:not(.navbar),
.bd-example > .bg-inverse:not(.navbar) {
  padding: .5rem;
  margin-top: .5rem;
  margin-bottom: .5rem;
}

.highlight {
  padding: 1rem;
  margin: 1rem -15px;
  background-color: #f7f7f9;
}

@media (min-width: 576px) {
  .highlight {
    padding: 1.5rem;
    margin-right: 0;
    margin-left: 0;
  }
}

.highlight pre {
  padding: 0;
  margin-top: 0;
  margin-bottom: 0;
  background-color: transparent;
  border: 0;
}

.highlight pre code {
  font-size: inherit;
  color: #373a3c;
}

.table-responsive .highlight pre {
  white-space: normal;
}

.bd-table th small,
.responsive-utilities th small {
  display: block;
  font-weight: normal;
  color: #999;
}

.responsive-utilities tbody th {
  font-weight: normal;
}

.responsive-utilities td {
  text-align: center;
}

.responsive-utilities .is-visible {
  color: #468847;
  background-color: #dff0d8 !important;
}

.responsive-utilities .is-hidden {
  color: #ccc;
  background-color: #f9f9f9 !important;
}

.responsive-utilities-test {
  margin-top: .25rem;
}

.responsive-utilities-test .col-xs-6 {
  margin-top: .5rem;
  margin-bottom: .5rem;
}

.responsive-utilities-test span {
  display: block;
  padding: 1rem .5rem;
  font-size: 1rem;
  font-weight: bold;
  line-height: 1.1;
  text-align: center;
  border-radius: .25rem;
}

.visible-on .col-xs-6 > .not-visible,
.hidden-on .col-xs-6 > .not-visible {
  color: #999;
  border: 1px solid #ddd;
}

.visible-on .col-xs-6 .visible,
.hidden-on .col-xs-6 .visible {
  color: #468847;
  background-color: #dff0d8;
  border: 1px solid #d6e9c6;
}

@media (max-width: 575px) {
  .hidden-xs-only {
    display: none !important;
  }
}

@media (min-width: 576px) and (max-width: 767px) {
  .hidden-sm-only {
    display: none !important;
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  .hidden-md-only {
    display: none !important;
  }
}

@media (min-width: 992px) and (max-width: 1199px) {
  .hidden-lg-only {
    display: none !important;
  }
}

@media (min-width: 1200px) {
  .hidden-xl-only {
    display: none !important;
  }
}

.btn-bs {
  font-weight: 500;
  color: #7952b3;
  border-color: #7952b3;
}

.btn-bs:hover, .btn-bs:focus, .btn-bs:active {
  color: #fff;
  background-color: #7952b3;
  border-color: #7952b3;
}

.bd-callout {
  padding: 1.25rem;
  margin-top: 1.25rem;
  margin-bottom: 1.25rem;
  border: 1px solid #eee;
  border-left-width: .25rem;
  border-radius: .25rem;
}

.bd-callout h4 {
  margin-top: 0;
  margin-bottom: .25rem;
}

.bd-callout p:last-child {
  margin-bottom: 0;
}

.bd-callout code {
  border-radius: .25rem;
}

.bd-callout + .bd-callout {
  margin-top: -.25rem;
}

.bd-callout-info {
  border-left-color: #5bc0de;
}

.bd-callout-info h4 {
  color: #5bc0de;
}

.bd-callout-warning {
  border-left-color: #f0ad4e;
}

.bd-callout-warning h4 {
  color: #f0ad4e;
}

.bd-callout-danger {
  border-left-color: #d9534f;
}

.bd-callout-danger h4 {
  color: #d9534f;
}

.bd-examples .img-thumbnail {
  margin-bottom: .75rem;
}

.bd-examples h4 {
  margin-bottom: .25rem;
}

.bd-examples p {
  margin-bottom: 1.25rem;
}

@media (max-width: 480px) {
  .bd-examples {
    margin-right: -.75rem;
    margin-left: -.75rem;
  }
  .bd-examples > [class^="col-"] {
    padding-right: .75rem;
    padding-left: .75rem;
  }
}

.bd-team {
  margin-bottom: 1.5rem;
}

.bd-team .team-member {
  line-height: 2rem;
  color: #555;
}

.bd-team .team-member:hover {
  color: #333;
  text-decoration: none;
}

.bd-team .github-btn {
  float: right;
  width: 180px;
  height: 1.25rem;
  margin-top: .25rem;
  border: 0;
}

.bd-team img {
  float: left;
  width: 2rem;
  margin-right: .5rem;
  border-radius: .25rem;
}

.bd-browser-bugs td p {
  margin-bottom: 0;
}

.bd-browser-bugs th:first-child {
  width: 18%;
}

.bd-brand-logos {
  display: table;
  width: 100%;
  margin-bottom: 1rem;
  overflow: hidden;
  color: #563d7c;
  background-color: #f9f9f9;
  border-radius: .25rem;
}

.bd-brand-item {
  padding: 4rem 0;
  text-align: center;
}

.bd-brand-item + .bd-brand-item {
  border-top: 1px solid #fff;
}

.bd-brand-logos .inverse {
  color: #fff;
  background-color: #563d7c;
}

.bd-brand-item h1,
.bd-brand-item h3 {
  margin-top: 0;
  margin-bottom: 0;
}

.bd-brand-item .bd-booticon {
  margin-right: auto;
  margin-left: auto;
}

@media (min-width: 768px) {
  .bd-brand-item {
    display: table-cell;
    width: 1%;
  }
  .bd-brand-item + .bd-brand-item {
    border-top: 0;
    border-left: 1px solid #fff;
  }
  .bd-brand-item h1 {
    font-size: 4rem;
  }
}

.color-swatches {
  margin: 0 -5px;
  overflow: hidden;
}

.color-swatch {
  float: left;
  width: 4rem;
  height: 4rem;
  margin-right: .25rem;
  margin-left: .25rem;
  border-radius: .25rem;
}

@media (min-width: 768px) {
  .color-swatch {
    width: 6rem;
    height: 6rem;
  }
}

.color-swatches .bd-purple {
  background-color: #563d7c;
}

.color-swatches .bd-purple-light {
  background-color: #cdbfe3;
}

.color-swatches .bd-purple-lighter {
  background-color: #e5e1ea;
}

.color-swatches .bd-gray {
  background-color: #f9f9f9;
}

.bd-clipboard {
  position: relative;
  display: none;
  float: right;
}

.bd-clipboard + .highlight {
  margin-top: 0;
}

.btn-clipboard {
  position: absolute;
  top: .5rem;
  right: .5rem;
  z-index: 10;
  display: block;
  padding: .25rem .5rem;
  font-size: 75%;
  color: #818a91;
  cursor: pointer;
  background-color: transparent;
  border-radius: .25rem;
}

.btn-clipboard:hover {
  color: #fff;
  background-color: #027de7;
}

@media (min-width: 768px) {
  .bd-clipboard {
    display: block;
  }
}

.language-bash::before {
  color: #009;
  content: "$ ";
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}

.language-powershell::before {
  color: #009;
  content: "PM> ";
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}

.anchorjs-link {
  color: inherit;
}

@media (max-width: 480px) {
  .anchorjs-link {
    display: none;
  }
}

*:hover > .anchorjs-link {
  opacity: .75;
  -webkit-transition: color .16s linear;
  -o-transition: color .16s linear;
  transition: color .16s linear;
}

*:hover > .anchorjs-link:hover,
.anchorjs-link:focus {
  text-decoration: none;
  opacity: 1;
}
</style>
</head>
<body>
<div class="error">
<p class="face">>.<</p>
<h1><?php echo strip_tags($e['message']);?></h1>
<div class="content">
<?php if(isset($e['file'])) {?>
	<div class="info">
		<div class="title">
			<h3>错误位置</h3>
		</div>
		<div class="text">
			<p>FILE: <?php echo $e['file'] ;?> &#12288;LINE: <?php echo $e['line'];?></p>
		</div>
	</div>
<?php }?>
<?php if(isset($e['trace'])) {?>
	<div class="info">
		<div class="title">
			<h3>TRACE</h3>
		</div>
		<div class="text">
			<p><?php echo nl2br($e['trace']);?></p>
		</div>
	</div>
<?php }?>
</div>
</div>
<footer class="bd-footer text-muted navbar-fixed-bottom">
  <div class="container">
  	<div style="float:left;">
		<ul class="bd-footer-links">
		  <li><a href="././././">回到首页</a></li>
		  <li><a href="javascript:window.history.back()">返回上一页</a></li>
		</ul>
		<p><a title="官方网站" href="https://github.com/martinzhou2015/SRCMS/">Powered By SRCMS</a><sup>2.2</sup> </p>
		<p>版本：v2.2.0-final.1. Code licensed GPL</a>.</p>
	</div>
	<div style="float:right">
	  <img src="data:image/png;base64,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" style="float:right;"></img>
	</div>
  </div>
</footer>
</body>
</html>
