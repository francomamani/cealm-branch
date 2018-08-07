


<!DOCTYPE html>
<html lang="en" class="">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    
    
    <title>slider/jssor.slider.mini.js at master · jssor/slider · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="jssor/slider" name="twitter:title" /><meta content="slider - Bootstrap Javascript jQuery Carousel/Slider/Slideshow/Gallery/Banner Responsive Image - http://jssor.com" name="twitter:description" /><meta content="https://avatars2.githubusercontent.com/u/5205605?v=3&amp;s=400" name="twitter:image:src" />
      <meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars2.githubusercontent.com/u/5205605?v=3&amp;s=400" property="og:image" /><meta content="jssor/slider" property="og:title" /><meta content="https://github.com/jssor/slider" property="og:url" /><meta content="slider - Bootstrap Javascript jQuery Carousel/Slider/Slideshow/Gallery/Banner Responsive Image - http://jssor.com" property="og:description" />
      <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">
    <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">
    <link rel="assets" href="https://assets-cdn.github.com/">
    
    <meta name="pjax-timeout" content="1000">
    

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>
      <meta name="google-analytics" content="UA-3769691-2">

    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="C86E33ED:5DB4:C02E392:555926F4" name="octolytics-dimension-request_id" />
    
    <meta content="Rails, view, blob#show" name="analytics-event" />
    <meta class="js-ga-set" name="dimension1" content="Logged Out">
    <meta class="js-ga-set" name="dimension2" content="Header v3">
    <meta name="is-dotcom" content="true">
    <meta name="hostname" content="github.com">
    <meta name="user-login" content="">

    
    <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">


    <meta content="authenticity_token" name="csrf-param" />
<meta content="6DMs2c/y2Hng+NjrdeZDg29e3Kufe4NJrzAugksvyBdInPrcpfP8M0REbsQa2IAy/XAZa1vD1AB7L2B0mSiQGw==" name="csrf-token" />

    <link href="https://assets-cdn.github.com/assets/github/index-d80e093fe7c48ff920ce83dfd2ad7c02806722220d164b49101ed783098ea618.css" media="all" rel="stylesheet" />
    <link href="https://assets-cdn.github.com/assets/github2/index-99a58ea750b0547d1266460cd4ade0c2c81ed8c524cbba4ea5e3b37e18daec79.css" media="all" rel="stylesheet" />
    
    


    <meta http-equiv="x-pjax-version" content="282d80bd51fc0e03270191711c02f726">

      
  <meta name="description" content="slider - Bootstrap Javascript jQuery Carousel/Slider/Slideshow/Gallery/Banner Responsive Image - http://jssor.com">
  <meta name="go-import" content="github.com/jssor/slider git https://github.com/jssor/slider.git">

  <meta content="5205605" name="octolytics-dimension-user_id" /><meta content="jssor" name="octolytics-dimension-user_login" /><meta content="15177360" name="octolytics-dimension-repository_id" /><meta content="jssor/slider" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="15177360" name="octolytics-dimension-repository_network_root_id" /><meta content="jssor/slider" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/jssor/slider/commits/master.atom" rel="alternate" title="Recent Commits to slider:master" type="application/atom+xml">

  </head>


  <body class="logged_out  env-production linux vis-public page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>
    <div class="wrapper">
      
      
      


        
        <div class="header header-logged-out" role="banner">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/" data-ga-click="(Logged out) Header, go to homepage, icon:logo-wordmark">
      <span class="mega-octicon octicon-logo-github"></span>
    </a>

    <div class="header-actions" role="navigation">
        <a class="btn btn-primary" href="/join" data-ga-click="(Logged out) Header, clicked Sign up, text:sign-up">Sign up</a>
      <a class="btn" href="/login?return_to=%2Fjssor%2Fslider%2Fblob%2Fmaster%2Fjs%2Fjssor.slider.mini.js" data-ga-click="(Logged out) Header, clicked Sign in, text:sign-in">Sign in</a>
    </div>

    <div class="site-search repo-scope js-site-search" role="search">
      <form accept-charset="UTF-8" action="/jssor/slider/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/jssor/slider/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
  <label class="js-chromeless-input-container form-control">
    <div class="scope-badge">This repository</div>
    <input type="text"
      class="js-site-search-focus js-site-search-field is-clearable chromeless-input"
      data-hotkey="s"
      name="q"
      placeholder="Search"
      data-global-scope-placeholder="Search GitHub"
      data-repo-scope-placeholder="Search"
      tabindex="1"
      autocapitalize="off">
  </label>
</form>
    </div>

      <ul class="header-nav left" role="navigation">
          <li class="header-nav-item">
            <a class="header-nav-link" href="/explore" data-ga-click="(Logged out) Header, go to explore, text:explore">Explore</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/features" data-ga-click="(Logged out) Header, go to features, text:features">Features</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://enterprise.github.com/" data-ga-click="(Logged out) Header, go to enterprise, text:enterprise">Enterprise</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/blog" data-ga-click="(Logged out) Header, go to blog, text:blog">Blog</a>
          </li>
      </ul>

  </div>
</div>



      <div id="start-of-content" class="accessibility-aid"></div>
          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    <div id="js-flash-container">
      
    </div>
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        
<ul class="pagehead-actions">

  <li>
      <a href="/login?return_to=%2Fjssor%2Fslider"
    class="btn btn-sm btn-with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to watch a repository" rel="nofollow">
    <span class="octicon octicon-eye"></span>
    Watch
  </a>
  <a class="social-count" href="/jssor/slider/watchers">
    102
  </a>

  </li>

  <li>
      <a href="/login?return_to=%2Fjssor%2Fslider"
    class="btn btn-sm btn-with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to star a repository" rel="nofollow">
    <span class="octicon octicon-star"></span>
    Star
  </a>

    <a class="social-count js-social-count" href="/jssor/slider/stargazers">
      786
    </a>

  </li>

    <li>
      <a href="/login?return_to=%2Fjssor%2Fslider"
        class="btn btn-sm btn-with-count tooltipped tooltipped-n"
        aria-label="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-repo-forked"></span>
        Fork
      </a>
      <a href="/jssor/slider/network" class="social-count">
        337
      </a>
    </li>
</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="mega-octicon octicon-repo"></span>
          <span class="author"><a href="/jssor" class="url fn" itemprop="url" rel="author"><span itemprop="title">jssor</span></a></span><!--
       --><span class="path-divider">/</span><!--
       --><strong><a href="/jssor/slider" class="js-current-repository" data-pjax="#js-repo-pjax-container">slider</a></strong>

          <span class="page-context-loader">
            <img alt="" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline  ">
        <div class="repository-sidebar clearfix">
            
<nav class="sunken-menu repo-nav js-repo-nav js-sidenav-container-pjax js-octicon-loaders"
     role="navigation"
     data-pjax="#js-repo-pjax-container"
     data-issue-count-url="/jssor/slider/issues/counts">
  <ul class="sunken-menu-group">
    <li class="tooltipped tooltipped-w" aria-label="Code">
      <a href="/jssor/slider" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /jssor/slider">
        <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Issues">
        <a href="/jssor/slider/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /jssor/slider/issues">
          <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
          <span class="js-issue-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>      </li>

    <li class="tooltipped tooltipped-w" aria-label="Pull requests">
      <a href="/jssor/slider/pulls" aria-label="Pull requests" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g p" data-selected-links="repo_pulls /jssor/slider/pulls">
          <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull requests</span>
          <span class="js-pull-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>

  </ul>
  <div class="sunken-menu-separator"></div>
  <ul class="sunken-menu-group">

    <li class="tooltipped tooltipped-w" aria-label="Pulse">
      <a href="/jssor/slider/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-selected-links="pulse /jssor/slider/pulse">
        <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>

    <li class="tooltipped tooltipped-w" aria-label="Graphs">
      <a href="/jssor/slider/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_graphs repo_contributors /jssor/slider/graphs">
        <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/assets/spinners/octocat-spinner-32-e513294efa576953719e4e2de888dd9cf929b7d62ed8d05f25e731d02452ab6c.gif" width="16" />
</a>    </li>
  </ul>


</nav>

              <div class="only-with-full-nav">
                  
<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><span class="text-emphasized">HTTPS</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/jssor/slider.git" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><span class="text-emphasized">Subversion</span> checkout URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/jssor/slider" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>



<p class="clone-options">You can clone with
  <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a> or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <a href="https://help.github.com/articles/which-remote-url-should-i-use" class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <span class="octicon octicon-question"></span>
  </a>
</p>




                <a href="/jssor/slider/archive/master.zip"
                   class="btn btn-sm sidebar-button"
                   aria-label="Download the contents of jssor/slider as a zip file"
                   title="Download the contents of jssor/slider as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>

          

<a href="/jssor/slider/blob/647898214e413a7530c9aacb3dd7b03ec9a13063/js/jssor.slider.mini.js" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:997f8db927d481366b5c9cced0e5b8e0 -->

<div class="file-navigation js-zeroclipboard-container">
  
<div class="select-menu js-menu-container js-select-menu left">
  <span class="btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    data-master-branch="master"
    data-ref="master"
    title="master"
    role="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Filter branches/tags" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open selected"
               href="/jssor/slider/blob/master/js/jssor.slider.mini.js"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="master">
                master
              </span>
            </a>
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/jssor/slider/tree/18.0/js/jssor.slider.mini.js"
                 data-name="18.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="18.0">18.0</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/jssor/slider/tree/17.0/js/jssor.slider.mini.js"
                 data-name="17.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="17.0">17.0</a>
            </div>
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/jssor/slider/tree/16.0/js/jssor.slider.mini.js"
                 data-name="16.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="16.0">16.0</a>
            </div>
        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

  <div class="btn-group right">
    <a href="/jssor/slider/find/master"
          class="js-show-file-finder btn btn-sm empty-icon tooltipped tooltipped-s"
          data-pjax
          data-hotkey="t"
          aria-label="Quickly jump between files">
      <span class="octicon octicon-list-unordered"></span>
    </a>
    <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
  </div>

  <div class="breadcrumb js-zeroclipboard-target">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/jssor/slider" class="" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">slider</span></a></span></span><span class="separator">/</span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/jssor/slider/tree/master/js" class="" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">js</span></a></span><span class="separator">/</span><strong class="final-path">jssor.slider.mini.js</strong>
  </div>
</div>


  <div class="commit file-history-tease">
    <div class="file-history-tease-header">
        <img alt="" class="avatar" height="24" src="https://0.gravatar.com/avatar/f5fbf620711a73884ea24aa3eadb6f00?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="24" />
        <span class="author"><span>jssor</span></span>
        <time datetime="2015-05-07T22:43:41Z" is="relative-time">May 8, 2015</time>
        <div class="commit-title">
            <a href="/jssor/slider/commit/647898214e413a7530c9aacb3dd7b03ec9a13063" class="message" data-pjax="true" title="iemobile touch action handling">iemobile touch action handling</a>
        </div>
    </div>

    <div class="participation">
      <p class="quickstat">
        <a href="#blob_contributors_box" rel="facebox">
          <strong>1</strong>
           contributor
        </a>
      </p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
          <li class="facebox-user-list-item">
            <img alt="@jacobrossi" data-user="2118562" height="24" src="https://avatars3.githubusercontent.com/u/2118562?v=3&amp;s=48" width="24" />
            <a href="/jacobrossi">jacobrossi</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file">
  <div class="file-header">
    <div class="file-actions">

      <div class="btn-group">
        <a href="/jssor/slider/raw/master/js/jssor.slider.mini.js" class="btn btn-sm " id="raw-url">Raw</a>
          <a href="/jssor/slider/blame/master/js/jssor.slider.mini.js" class="btn btn-sm js-update-url-with-hash">Blame</a>
        <a href="/jssor/slider/commits/master/js/jssor.slider.mini.js" class="btn btn-sm " rel="nofollow">History</a>
      </div>


          <button type="button" class="octicon-btn disabled tooltipped tooltipped-n" aria-label="You must be signed in to make or propose changes">
            <span class="octicon octicon-pencil"></span>
          </button>

        <button type="button" class="octicon-btn octicon-btn-danger disabled tooltipped tooltipped-n" aria-label="You must be signed in to make or propose changes">
          <span class="octicon octicon-trashcan"></span>
        </button>
    </div>

    <div class="file-info">
        2 lines (2 sloc)
        <span class="file-info-divider"></span>
      41.814 kb
    </div>
  </div>
  
  <div class="blob-wrapper data type-javascript">
      <table class="highlight tab-size-8 js-file-line-container">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code blob-code-inner js-file-line">﻿(function(h,e,b,i,c,g,j){/*! Jssor */</td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code blob-code-inner js-file-line">new(function(){});var d=h.$JssorEasing$={$EaseSwing:function(a){return-b.cos(a*b.PI)/2+.5},$EaseLinear:function(a){return a},$EaseInQuad:function(a){return a*a},$EaseOutQuad:function(a){return-a*(a-2)},$EaseInOutQuad:function(a){return(a*=2)&lt;1?1/2*a*a:-1/2*(--a*(a-2)-1)},$EaseInCubic:function(a){return a*a*a},$EaseOutCubic:function(a){return(a-=1)*a*a+1},$EaseInOutCubic:function(a){return(a*=2)&lt;1?1/2*a*a*a:1/2*((a-=2)*a*a+2)},$EaseInQuart:function(a){return a*a*a*a},$EaseOutQuart:function(a){return-((a-=1)*a*a*a-1)},$EaseInOutQuart:function(a){return(a*=2)&lt;1?1/2*a*a*a*a:-1/2*((a-=2)*a*a*a-2)},$EaseInQuint:function(a){return a*a*a*a*a},$EaseOutQuint:function(a){return(a-=1)*a*a*a*a+1},$EaseInOutQuint:function(a){return(a*=2)&lt;1?1/2*a*a*a*a*a:1/2*((a-=2)*a*a*a*a+2)},$EaseInSine:function(a){return 1-b.cos(a*b.PI/2)},$EaseOutSine:function(a){return b.sin(a*b.PI/2)},$EaseInOutSine:function(a){return-1/2*(b.cos(b.PI*a)-1)},$EaseInExpo:function(a){return a==0?0:b.pow(2,10*(a-1))},$EaseOutExpo:function(a){return a==1?1:-b.pow(2,-10*a)+1},$EaseInOutExpo:function(a){return a==0||a==1?a:(a*=2)&lt;1?1/2*b.pow(2,10*(a-1)):1/2*(-b.pow(2,-10*--a)+2)},$EaseInCirc:function(a){return-(b.sqrt(1-a*a)-1)},$EaseOutCirc:function(a){return b.sqrt(1-(a-=1)*a)},$EaseInOutCirc:function(a){return(a*=2)&lt;1?-1/2*(b.sqrt(1-a*a)-1):1/2*(b.sqrt(1-(a-=2)*a)+1)},$EaseInElastic:function(a){if(!a||a==1)return a;var c=.3,d=.075;return-(b.pow(2,10*(a-=1))*b.sin((a-d)*2*b.PI/c))},$EaseOutElastic:function(a){if(!a||a==1)return a;var c=.3,d=.075;return b.pow(2,-10*a)*b.sin((a-d)*2*b.PI/c)+1},$EaseInOutElastic:function(a){if(!a||a==1)return a;var c=.45,d=.1125;return(a*=2)&lt;1?-.5*b.pow(2,10*(a-=1))*b.sin((a-d)*2*b.PI/c):b.pow(2,-10*(a-=1))*b.sin((a-d)*2*b.PI/c)*.5+1},$EaseInBack:function(a){var b=1.70158;return a*a*((b+1)*a-b)},$EaseOutBack:function(a){var b=1.70158;return(a-=1)*a*((b+1)*a+b)+1},$EaseInOutBack:function(a){var b=1.70158;return(a*=2)&lt;1?1/2*a*a*(((b*=1.525)+1)*a-b):1/2*((a-=2)*a*(((b*=1.525)+1)*a+b)+2)},$EaseInBounce:function(a){return 1-d.$EaseOutBounce(1-a)},$EaseOutBounce:function(a){return a&lt;1/2.75?7.5625*a*a:a&lt;2/2.75?7.5625*(a-=1.5/2.75)*a+.75:a&lt;2.5/2.75?7.5625*(a-=2.25/2.75)*a+.9375:7.5625*(a-=2.625/2.75)*a+.984375},$EaseInOutBounce:function(a){return a&lt;1/2?d.$EaseInBounce(a*2)*.5:d.$EaseOutBounce(a*2-1)*.5+.5},$EaseGoBack:function(a){return 1-b.abs(2-1)},$EaseInWave:function(a){return 1-b.cos(a*b.PI*2)},$EaseOutWave:function(a){return b.sin(a*b.PI*2)},$EaseOutJump:function(a){return 1-((a*=2)&lt;1?(a=1-a)*a*a:(a-=1)*a*a)},$EaseInJump:function(a){return(a*=2)&lt;1?a*a*a:(a=2-a)*a*a}};var a=new function(){var f=this,xb=/\S+/g,T=1,fb=2,kb=3,jb=4,ob=5,L,s=0,l=0,p=0,bb=0,A=0,B=navigator,tb=B.appName,k=B.userAgent,z;function Eb(){if(!L){L={he:&quot;ontouchstart&quot;in h||&quot;createTouch&quot;in e};var a;if(B.pointerEnabled||(a=B.msPointerEnabled))L.od=a?&quot;msTouchAction&quot;:&quot;touchAction&quot;}return L}function v(i){if(!s){s=-1;if(tb==&quot;Microsoft Internet Explorer&quot;&amp;&amp;!!h.attachEvent&amp;&amp;!!h.ActiveXObject){var f=k.indexOf(&quot;MSIE&quot;);s=T;p=n(k.substring(f+5,k.indexOf(&quot;;&quot;,f)));/*@cc_on bb=@_jscript_version@*/;l=e.documentMode||p}else if(tb==&quot;Netscape&quot;&amp;&amp;!!h.addEventListener){var d=k.indexOf(&quot;Firefox&quot;),b=k.indexOf(&quot;Safari&quot;),g=k.indexOf(&quot;Chrome&quot;),c=k.indexOf(&quot;AppleWebKit&quot;);if(d&gt;=0){s=fb;l=n(k.substring(d+8))}else if(b&gt;=0){var j=k.substring(0,b).lastIndexOf(&quot;/&quot;);s=g&gt;=0?jb:kb;l=n(k.substring(j+1,b))}else{var a=/Trident\/.*rv:([0-9]{1,}[\.0-9]{0,})/i.exec(k);if(a){s=T;l=p=n(a[1])}}if(c&gt;=0)A=n(k.substring(c+12))}else{var a=/(opera)(?:.*version|)[ \/]([\w.]+)/i.exec(k);if(a){s=ob;l=n(a[2])}}}return i==s}function q(){return v(T)}function O(){return q()&amp;&amp;(l&lt;6||e.compatMode==&quot;BackCompat&quot;)}function ib(){return v(kb)}function hb(){return v(jb)}function nb(){return v(ob)}function cb(){return ib()&amp;&amp;A&gt;534&amp;&amp;A&lt;535}function M(){return q()&amp;&amp;l&lt;9}function t(a){if(!z){m([&quot;transform&quot;,&quot;WebkitTransform&quot;,&quot;msTransform&quot;,&quot;MozTransform&quot;,&quot;OTransform&quot;],function(b){if(a.style[b]!=j){z=b;return c}});z=z||&quot;transform&quot;}return z}function sb(a){return{}.toString.call(a)}var K;function Cb(){if(!K){K={};m([&quot;Boolean&quot;,&quot;Number&quot;,&quot;String&quot;,&quot;Function&quot;,&quot;Array&quot;,&quot;Date&quot;,&quot;RegExp&quot;,&quot;Object&quot;],function(a){K[&quot;[object &quot;+a+&quot;]&quot;]=a.toLowerCase()})}return K}function m(a,d){if(sb(a)==&quot;[object Array]&quot;){for(var b=0;b&lt;a.length;b++)if(d(a[b],b,a))return c}else for(var e in a)if(d(a[e],e,a))return c}function D(a){return a==i?String(a):Cb()[sb(a)]||&quot;object&quot;}function qb(a){for(var b in a)return c}function G(a){try{return D(a)==&quot;object&quot;&amp;&amp;!a.nodeType&amp;&amp;a!=a.window&amp;&amp;(!a.constructor||{}.hasOwnProperty.call(a.constructor.prototype,&quot;isPrototypeOf&quot;))}catch(b){}}function y(a,b){return{x:a,y:b}}function vb(b,a){setTimeout(b,a||0)}function I(b,d,c){var a=!b||b==&quot;inherit&quot;?&quot;&quot;:b;m(d,function(c){var b=c.exec(a);if(b){var d=a.substr(0,b.index),e=a.substr(b.lastIndex+1,a.length-(b.lastIndex+1));a=d+e}});a=c+(a.indexOf(&quot; &quot;)!=0?&quot; &quot;:&quot;&quot;)+a;return a}function eb(b,a){if(l&lt;9)b.style.filter=a}function zb(b,a,c){if(bb&lt;9){var e=b.style.filter,h=new RegExp(/[\s]*progid:DXImageTransform\.Microsoft\.Matrix\([^\)]*\)/g),g=a?&quot;progid:DXImageTransform.Microsoft.Matrix(M11=&quot;+a[0][0]+&quot;, M12=&quot;+a[0][1]+&quot;, M21=&quot;+a[1][0]+&quot;, M22=&quot;+a[1][1]+&quot;, SizingMethod=&#39;auto expand&#39;)&quot;:&quot;&quot;,d=I(e,[h],g);eb(b,d);f.rd(b,c.y);f.Lc(b,c.x)}}f.ge=Eb;f.ud=q;f.ie=ib;f.de=hb;f.vc=nb;f.T=M;f.cd=function(){return l};f.uc=function(){v();return A};f.$Delay=vb;function W(a){a.constructor===W.caller&amp;&amp;a.ad&amp;&amp;a.ad.apply(a,W.caller.arguments)}f.ad=W;f.Z=function(a){if(f.fd(a))a=e.getElementById(a);return a};function r(a){return a||h.event}f.kd=r;f.rc=function(a){a=r(a);return a.target||a.srcElement||e};f.md=function(a){a=r(a);return{x:a.pageX||a.clientX||0,y:a.pageY||a.clientY||0}};function E(c,d,a){if(a!=j)c.style[d]=a;else{var b=c.currentStyle||c.style;a=b[d];if(a==&quot;&quot;&amp;&amp;h.getComputedStyle){b=c.ownerDocument.defaultView.getComputedStyle(c,i);b&amp;&amp;(a=b.getPropertyValue(d)||b[d])}return a}}function Y(b,c,a,d){if(a!=j){d&amp;&amp;(a+=&quot;px&quot;);E(b,c,a)}else return n(E(b,c))}function o(d,a){var b=a&amp;2,c=a?Y:E;return function(e,a){return c(e,d,a,b)}}function Ab(b){if(q()&amp;&amp;p&lt;9){var a=/opacity=([^)]*)/.exec(b.style.filter||&quot;&quot;);return a?n(a[1])/100:1}else return n(b.style.opacity||&quot;1&quot;)}function Bb(c,a,f){if(q()&amp;&amp;p&lt;9){var h=c.style.filter||&quot;&quot;,i=new RegExp(/[\s]*alpha\([^\)]*\)/g),e=b.round(100*a),d=&quot;&quot;;if(e&lt;100||f)d=&quot;alpha(opacity=&quot;+e+&quot;) &quot;;var g=I(h,[i],d);eb(c,g)}else c.style.opacity=a==1?&quot;&quot;:b.round(a*100)/100}function ab(e,a){var d=a.$Rotate||0,c=a.$Scale==j?1:a.$Scale;if(M()){var l=f.pe(d/180*b.PI,c,c);zb(e,!d&amp;&amp;c==1?i:l,f.se(l,a.$OriginalWidth,a.$OriginalHeight))}else{var g=t(e);if(g){var k=&quot;rotate(&quot;+d%360+&quot;deg) scale(&quot;+c+&quot;)&quot;;if(hb()&amp;&amp;A&gt;535&amp;&amp;&quot;ontouchstart&quot;in h)k+=&quot; perspective(2000px)&quot;;e.style[g]=k}}}f.re=function(b,a){if(cb())vb(f.L(i,ab,b,a));else ab(b,a)};f.me=function(b,c){var a=t(b);if(a)b.style[a+&quot;Origin&quot;]=c};f.le=function(a,c){if(q()&amp;&amp;p&lt;9||p&lt;10&amp;&amp;O())a.style.zoom=c==1?&quot;&quot;:c;else{var b=t(a);if(b){var f=&quot;scale(&quot;+c+&quot;)&quot;,e=a.style[b],g=new RegExp(/[\s]*scale\(.*?\)/g),d=I(e,[g],f);a.style[b]=d}}};f.oe=function(a){if(!a.style[t(a)]||a.style[t(a)]==&quot;none&quot;)a.style[t(a)]=&quot;perspective(2000px)&quot;};f.Ob=function(b,a){return function(c){c=r(c);var e=c.type,d=c.relatedTarget||(e==&quot;mouseout&quot;?c.toElement:c.fromElement);(!d||d!==a&amp;&amp;!f.nf(a,d))&amp;&amp;b(c)}};f.c=function(a,c,d,b){a=f.Z(a);if(a.addEventListener){c==&quot;mousewheel&quot;&amp;&amp;a.addEventListener(&quot;DOMMouseScroll&quot;,d,b);a.addEventListener(c,d,b)}else if(a.attachEvent){a.attachEvent(&quot;on&quot;+c,d);b&amp;&amp;a.setCapture&amp;&amp;a.setCapture()}};f.M=function(a,c,d,b){a=f.Z(a);if(a.removeEventListener){c==&quot;mousewheel&quot;&amp;&amp;a.removeEventListener(&quot;DOMMouseScroll&quot;,d,b);a.removeEventListener(c,d,b)}else if(a.detachEvent){a.detachEvent(&quot;on&quot;+c,d);b&amp;&amp;a.releaseCapture&amp;&amp;a.releaseCapture()}};f.Ib=function(a){a=r(a);a.preventDefault&amp;&amp;a.preventDefault();a.cancel=c;a.returnValue=g};f.af=function(a){a=r(a);a.stopPropagation&amp;&amp;a.stopPropagation();a.cancelBubble=c};f.L=function(d,c){var a=[].slice.call(arguments,2),b=function(){var b=a.concat([].slice.call(arguments,0));return c.apply(d,b)};return b};f.ff=function(a,b){if(b==j)return a.textContent||a.innerText;var c=e.createTextNode(b);f.hc(a);a.appendChild(c)};f.P=function(d,c){for(var b=[],a=d.firstChild;a;a=a.nextSibling)(c||a.nodeType==1)&amp;&amp;b.push(a);return b};function rb(a,c,e,b){b=b||&quot;u&quot;;for(a=a?a.firstChild:i;a;a=a.nextSibling)if(a.nodeType==1){if(S(a,b)==c)return a;if(!e){var d=rb(a,c,e,b);if(d)return d}}}f.A=rb;function Q(a,d,f,b){b=b||&quot;u&quot;;var c=[];for(a=a?a.firstChild:i;a;a=a.nextSibling)if(a.nodeType==1){S(a,b)==d&amp;&amp;c.push(a);if(!f){var e=Q(a,d,f,b);if(e.length)c=c.concat(e)}}return c}function lb(a,c,d){for(a=a?a.firstChild:i;a;a=a.nextSibling)if(a.nodeType==1){if(a.tagName==c)return a;if(!d){var b=lb(a,c,d);if(b)return b}}}f.of=lb;function db(a,c,e){var b=[];for(a=a?a.firstChild:i;a;a=a.nextSibling)if(a.nodeType==1){(!c||a.tagName==c)&amp;&amp;b.push(a);if(!e){var d=db(a,c,e);if(d.length)b=b.concat(d)}}return b}f.mf=db;f.jf=function(b,a){return b.getElementsByTagName(a)};function C(){var e=arguments,d,c,b,a,g=1&amp;e[0],f=1+g;d=e[f-1]||{};for(;f&lt;e.length;f++)if(c=e[f])for(b in c){a=c[b];if(a!==j){a=c[b];d[b]=g&amp;&amp;G(d[b])?C(g,{},a):a}}return d}f.n=C;function X(f,g){var d={},c,a,b;for(c in f){a=f[c];b=g[c];if(a!==b){var e;if(G(a)&amp;&amp;G(b)){a=X(b);e=!qb(a)}!e&amp;&amp;(d[c]=a)}}return d}f.Ic=function(a){return D(a)==&quot;function&quot;};f.Zb=function(a){return D(a)==&quot;array&quot;};f.fd=function(a){return D(a)==&quot;string&quot;};f.Hc=function(a){return!isNaN(n(a))&amp;&amp;isFinite(a)};f.e=m;function P(a){return e.createElement(a)}f.ab=function(){return P(&quot;DIV&quot;)};f.Re=function(){return P(&quot;SPAN&quot;)};f.jc=function(){};function U(b,c,a){if(a==j)return b.getAttribute(c);b.setAttribute(c,a)}function S(a,b){return U(a,b)||U(a,&quot;data-&quot;+b)}f.I=U;f.u=S;function w(b,a){if(a==j)return b.className;b.className=a}f.Rc=w;function ub(b){var a={};m(b,function(b){a[b]=b});return a}function wb(b,a){return b.match(a||xb)}function N(b,a){return ub(wb(b||&quot;&quot;,a))}f.Le=wb;function Z(b,c){var a=&quot;&quot;;m(c,function(c){a&amp;&amp;(a+=b);a+=c});return a}function H(a,c,b){w(a,Z(&quot; &quot;,C(X(N(w(a)),N(c)),N(b))))}f.zb=function(a){return a.parentNode};f.J=function(a){f.V(a,&quot;none&quot;)};f.B=function(a,b){f.V(a,b?&quot;none&quot;:&quot;&quot;)};f.Qc=function(b,a){b.removeAttribute(a)};f.Se=function(){return q()&amp;&amp;l&lt;10};f.Te=function(d,c){if(c)d.style.clip=&quot;rect(&quot;+b.round(c.$Top)+&quot;px &quot;+b.round(c.$Right)+&quot;px &quot;+b.round(c.$Bottom)+&quot;px &quot;+b.round(c.$Left)+&quot;px)&quot;;else{var g=d.style.cssText,f=[new RegExp(/[\s]*clip: rect\(.*?\)[;]?/i),new RegExp(/[\s]*cliptop: .*?[;]?/i),new RegExp(/[\s]*clipright: .*?[;]?/i),new RegExp(/[\s]*clipbottom: .*?[;]?/i),new RegExp(/[\s]*clipleft: .*?[;]?/i)],e=I(g,f,&quot;&quot;);a.Gb(d,e)}};f.K=function(){return+new Date};f.E=function(b,a){b.appendChild(a)};f.Nb=function(b,a,c){(c||a.parentNode).insertBefore(b,a)};f.Db=function(a,b){(b||a.parentNode).removeChild(a)};f.Me=function(a,b){m(a,function(a){f.Db(a,b)})};f.hc=function(a){f.Me(f.P(a,c),a)};f.Ne=function(b,a){return parseInt(b,a||10)};var n=parseFloat;f.tc=n;f.nf=function(b,a){var c=e.body;while(a&amp;&amp;b!==a&amp;&amp;c!==a)try{a=a.parentNode}catch(d){return g}return b===a};function V(d,c,b){var a=d.cloneNode(!c);!b&amp;&amp;f.Qc(a,&quot;id&quot;);return a}f.U=V;f.rb=function(e,g){var a=new Image;function b(e,c){f.M(a,&quot;load&quot;,b);f.M(a,&quot;abort&quot;,d);f.M(a,&quot;error&quot;,d);g&amp;&amp;g(a,c)}function d(a){b(a,c)}if(nb()&amp;&amp;l&lt;11.6||!e)b(!e);else{f.c(a,&quot;load&quot;,b);f.c(a,&quot;abort&quot;,d);f.c(a,&quot;error&quot;,d);a.src=e}};f.cf=function(d,a,e){var c=d.length+1;function b(b){c--;if(a&amp;&amp;b&amp;&amp;b.src==a.src)a=b;!c&amp;&amp;e&amp;&amp;e(a)}m(d,function(a){f.rb(a.src,b)});b()};f.Dc=function(b,g,i,h){if(h)b=V(b);var c=Q(b,g);if(!c.length)c=a.jf(b,g);for(var f=c.length-1;f&gt;-1;f--){var d=c[f],e=V(i);w(e,w(d));a.Gb(e,d.style.cssText);a.Nb(e,d);a.Db(d)}return b};function Db(c){var q=this,o=&quot;&quot;,r=[&quot;av&quot;,&quot;pv&quot;,&quot;ds&quot;,&quot;dn&quot;],d=[],p,k=0,h=0,g=0;function i(){H(c,p,d[g||k||h&amp;2||h])}function b(){k=0;i();f.M(e,&quot;mouseup&quot;,b);f.M(e,&quot;touchend&quot;,b);f.M(e,&quot;touchcancel&quot;,b)}function n(a){if(g)f.Ib(a);else{k=4;i();f.c(e,&quot;mouseup&quot;,b);f.c(e,&quot;touchend&quot;,b);f.c(e,&quot;touchcancel&quot;,b)}}q.Ec=function(a){if(a!=j){h=a&amp;2||a&amp;1;i()}else return h};q.$Enable=function(a){if(a==j)return!g;g=a?0:3;i()};c=f.Z(c);var l=a.Le(w(c));if(l)o=l.shift();m(r,function(a){d.push(o+a)});p=Z(&quot; &quot;,d);d.unshift(&quot;&quot;);f.c(c,&quot;mousedown&quot;,n);f.c(c,&quot;touchstart&quot;,n)}f.Mb=function(a){return new Db(a)};f.sb=E;f.bb=o(&quot;overflow&quot;);f.z=o(&quot;top&quot;,2);f.C=o(&quot;left&quot;,2);f.k=o(&quot;width&quot;,2);f.l=o(&quot;height&quot;,2);f.Lc=o(&quot;marginLeft&quot;,2);f.rd=o(&quot;marginTop&quot;,2);f.D=o(&quot;position&quot;);f.V=o(&quot;display&quot;);f.G=o(&quot;zIndex&quot;,1);f.Ab=function(b,a,c){if(a!=j)Bb(b,a,c);else return Ab(b)};f.Gb=function(a,b){if(b!=j)a.style.cssText=b;else return a.style.cssText};var R={$Opacity:f.Ab,$Top:f.z,$Left:f.C,hb:f.k,gb:f.l,tb:f.D,yg:f.V,$ZIndex:f.G},u;function J(){if(!u)u=C({zg:f.rd,Ag:f.Lc,$Clip:f.Te,bc:f.re},R);return u}function pb(){J();u.bc=u.bc;return u}f.Qd=J;f.Od=pb;f.zd=function(c,b){J();var a={};m(b,function(d,b){if(R[b])a[b]=R[b](c)});return a};f.H=function(c,b){var a=J();m(b,function(d,b){a[b]&amp;&amp;a[b](c,d)})};f.Nd=function(b,a){pb();f.H(b,a)};var F=new function(){var a=this;function b(d,g){for(var j=d[0].length,i=d.length,h=g[0].length,f=[],c=0;c&lt;i;c++)for(var k=f[c]=[],b=0;b&lt;h;b++){for(var e=0,a=0;a&lt;j;a++)e+=d[c][a]*g[a][b];k[b]=e}return f}a.Lb=function(d,c){var a=b(d,[[c.x],[c.y]]);return y(a[0][0],a[1][0])}};f.pe=function(d,a,c){var e=b.cos(d),f=b.sin(d);return[[e*a,-f*c],[f*a,e*c]]};f.se=function(d,c,a){var e=F.Lb(d,y(-c/2,-a/2)),f=F.Lb(d,y(c/2,-a/2)),g=F.Lb(d,y(c/2,a/2)),h=F.Lb(d,y(-c/2,a/2));return y(b.min(e.x,f.x,g.x,h.x)+c/2,b.min(e.y,f.y,g.y,h.y)+a/2)};f.vd=function(l,g,t,r,u,w,j){var c=g;if(l){c={};for(var f in g){var x=w[f]||1,s=u[f]||[0,1],e=(t-s[0])/s[1];e=b.min(b.max(e,0),1);e=e*x;var p=b.floor(e);if(e!=p)e-=p;var v=r[f]||r.wb||d.$EaseSwing,q=v(e),h,y=l[f];g[f];var m=g[f];if(a.Hc(m))h=y+m*q;else{h=a.n({xb:{}},l[f]);a.e(m.xb,function(c,b){var a=c*q;h.xb[b]=a;h[b]+=a})}c[f]=h}if(g.$Zoom||g.$Rotate)c.bc={$Rotate:c.$Rotate||0,$Scale:c.$Zoom,$OriginalWidth:j.$OriginalWidth,$OriginalHeight:j.$OriginalHeight}}if(g.$Clip&amp;&amp;j.$Move){var k=c.$Clip.xb,o=(k.$Top||0)+(k.$Bottom||0),n=(k.$Left||0)+(k.$Right||0);c.$Left=(c.$Left||0)+n;c.$Top=(c.$Top||0)+o;c.$Clip.$Left-=n;c.$Clip.$Right-=n;c.$Clip.$Top-=o;c.$Clip.$Bottom-=o}if(c.$Clip&amp;&amp;a.Se()&amp;&amp;!c.$Clip.$Top&amp;&amp;!c.$Clip.$Left&amp;&amp;c.$Clip.$Right==j.$OriginalWidth&amp;&amp;c.$Clip.$Bottom==j.$OriginalHeight)c.$Clip=i;return c}};function l(){var b=this,d=[];function i(a,b){d.push({lc:a,ac:b})}function g(b,c){a.e(d,function(a,e){a.lc==b&amp;&amp;a.ac===c&amp;&amp;d.splice(e,1)})}b.$On=b.addEventListener=i;b.$Off=b.removeEventListener=g;b.j=function(b){var c=[].slice.call(arguments,1);a.e(d,function(a){a.lc==b&amp;&amp;a.ac.apply(h,c)})}}function k(o,z,k,R,P,K){o=o||0;var e=this,s,p,q,x,B=0,I,J,H,D,A=0,l=0,n=0,E,m=o,f,j,r,y=[],C;function M(a){f+=a;j+=a;m+=a;l+=a;n+=a;A=a}function Q(a,b){var c=a-f+o*b;M(c);return j}function w(o,i){var d=o;if(r&amp;&amp;(d&gt;=j||d&lt;=f))d=((d-f)%r+r)%r+f;if(!E||x||i||l!=d){var g=b.min(d,j);g=b.max(g,f);if(!E||x||i||g!=n){if(K){var h=(g-m)/(z||1);if(k.$Reverse)h=1-h;var p=a.vd(P,K,h,I,H,J,k);a.e(p,function(b,a){C[a]&amp;&amp;C[a](R,b)})}e.ec(n-m,g-m);n=g;a.e(y,function(b,c){var a=o&lt;l?y[y.length-c-1]:b;a.v(n-A,i)});var s=l,q=n;l=d;E=c;e.Fb(s,q)}}}function F(a,c,d){c&amp;&amp;a.Hb(j,1);if(!d){f=b.min(f,a.Bd()+A);j=b.max(j,a.ib()+A)}y.push(a)}var t=h.requestAnimationFrame||h.webkitRequestAnimationFrame||h.mozRequestAnimationFrame||h.msRequestAnimationFrame;if(a.ie()&amp;&amp;a.cd()&lt;7)t=i;t=t||function(b){a.$Delay(b,k.$Interval)};function L(){if(s){var d=a.K(),e=b.min(d-B,k.wd),c=l+e*q;B=d;if(c*q&gt;=p*q)c=p;w(c);if(!x&amp;&amp;c*q&gt;=p*q)N(D);else t(L)}}function v(d,g,h){if(!s){s=c;x=h;D=g;d=b.max(d,f);d=b.min(d,j);p=d;q=p&lt;l?-1:1;e.xd();B=a.K();t(L)}}function N(a){if(s){x=s=D=g;e.ed();a&amp;&amp;a()}}e.$Play=function(a,b,c){v(a?l+a:j,b,c)};e.jd=v;e.fb=N;e.Td=function(a){v(a)};e.R=function(){return l};e.ld=function(){return p};e.qb=function(){return n};e.v=w;e.$Move=function(a){w(l+a)};e.$IsPlaying=function(){return s};e.Kd=function(a){r=a};e.Hb=Q;e.$Shift=M;e.W=function(a){F(a,0)};e.kc=function(a){F(a,1)};e.Bd=function(){return f};e.ib=function(){return j};e.Fb=e.xd=e.ed=e.ec=a.jc;e.ic=a.K();k=a.n({$Interval:16,wd:50},k);r=k.nd;C=a.n({},a.Qd(),k.Yb);f=m=o;j=o+z;J=k.$Round||{};H=k.$During||{};I=a.n({wb:a.Ic(k.$Easing)&amp;&amp;k.$Easing||d.$EaseSwing},k.$Easing)}var n=h.$JssorSlideshowFormations$=new function(){var h=this,d=0,a=1,f=2,e=3,s=1,r=2,t=4,q=8,w=256,x=512,v=1024,u=2048,j=u+s,i=u+r,o=x+s,m=x+r,n=w+t,k=w+q,l=v+t,p=v+q;function y(a){return(a&amp;r)==r}function z(a){return(a&amp;t)==t}function g(b,a,c){c.push(a);b[a]=b[a]||[];b[a].push(c)}h.$FormationStraight=function(f){for(var d=f.$Cols,e=f.$Rows,s=f.$Assembly,t=f.Xb,r=[],a=0,b=0,p=d-1,q=e-1,h=t-1,c,b=0;b&lt;e;b++)for(a=0;a&lt;d;a++){switch(s){case j:c=h-(a*e+(q-b));break;case l:c=h-(b*d+(p-a));break;case o:c=h-(a*e+b);case n:c=h-(b*d+a);break;case i:c=a*e+b;break;case k:c=b*d+(p-a);break;case m:c=a*e+(q-b);break;default:c=b*d+a}g(r,c,[b,a])}return r};h.$FormationSwirl=function(q){var x=q.$Cols,y=q.$Rows,B=q.$Assembly,w=q.Xb,A=[],z=[],u=0,b=0,h=0,r=x-1,s=y-1,t,p,v=0;switch(B){case j:b=r;h=0;p=[f,a,e,d];break;case l:b=0;h=s;p=[d,e,a,f];break;case o:b=r;h=s;p=[e,a,f,d];break;case n:b=r;h=s;p=[a,e,d,f];break;case i:b=0;h=0;p=[f,d,e,a];break;case k:b=r;h=0;p=[a,f,d,e];break;case m:b=0;h=s;p=[e,d,f,a];break;default:b=0;h=0;p=[d,f,a,e]}u=0;while(u&lt;w){t=h+&quot;,&quot;+b;if(b&gt;=0&amp;&amp;b&lt;x&amp;&amp;h&gt;=0&amp;&amp;h&lt;y&amp;&amp;!z[t]){z[t]=c;g(A,u++,[h,b])}else switch(p[v++%p.length]){case d:b--;break;case f:h--;break;case a:b++;break;case e:h++}switch(p[v%p.length]){case d:b++;break;case f:h++;break;case a:b--;break;case e:h--}}return A};h.$FormationZigZag=function(p){var w=p.$Cols,x=p.$Rows,z=p.$Assembly,v=p.Xb,t=[],u=0,b=0,c=0,q=w-1,r=x-1,y,h,s=0;switch(z){case j:b=q;c=0;h=[f,a,e,a];break;case l:b=0;c=r;h=[d,e,a,e];break;case o:b=q;c=r;h=[e,a,f,a];break;case n:b=q;c=r;h=[a,e,d,e];break;case i:b=0;c=0;h=[f,d,e,d];break;case k:b=q;c=0;h=[a,f,d,f];break;case m:b=0;c=r;h=[e,d,f,d];break;default:b=0;c=0;h=[d,f,a,f]}u=0;while(u&lt;v){y=c+&quot;,&quot;+b;if(b&gt;=0&amp;&amp;b&lt;w&amp;&amp;c&gt;=0&amp;&amp;c&lt;x&amp;&amp;typeof t[y]==&quot;undefined&quot;){g(t,u++,[c,b]);switch(h[s%h.length]){case d:b++;break;case f:c++;break;case a:b--;break;case e:c--}}else{switch(h[s++%h.length]){case d:b--;break;case f:c--;break;case a:b++;break;case e:c++}switch(h[s++%h.length]){case d:b++;break;case f:c++;break;case a:b--;break;case e:c--}}}return t};h.$FormationStraightStairs=function(q){var u=q.$Cols,v=q.$Rows,e=q.$Assembly,t=q.Xb,r=[],s=0,c=0,d=0,f=u-1,h=v-1,x=t-1;switch(e){case j:case m:case o:case i:var a=0,b=0;break;case k:case l:case n:case p:var a=f,b=0;break;default:e=p;var a=f,b=0}c=a;d=b;while(s&lt;t){if(z(e)||y(e))g(r,x-s++,[d,c]);else g(r,s++,[d,c]);switch(e){case j:case m:c--;d++;break;case o:case i:c++;d--;break;case k:case l:c--;d--;break;case p:case n:default:c++;d++}if(c&lt;0||d&lt;0||c&gt;f||d&gt;h){switch(e){case j:case m:a++;break;case k:case l:case o:case i:b++;break;case p:case n:default:a--}if(a&lt;0||b&lt;0||a&gt;f||b&gt;h){switch(e){case j:case m:a=f;b++;break;case o:case i:b=h;a++;break;case k:case l:b=h;a--;break;case p:case n:default:a=0;b++}if(b&gt;h)b=h;else if(b&lt;0)b=0;else if(a&gt;f)a=f;else if(a&lt;0)a=0}d=b;c=a}}return r};h.$FormationSquare=function(i){var a=i.$Cols||1,c=i.$Rows||1,j=[],d,e,f,h,k;f=a&lt;c?(c-a)/2:0;h=a&gt;c?(a-c)/2:0;k=b.round(b.max(a/2,c/2))+1;for(d=0;d&lt;a;d++)for(e=0;e&lt;c;e++)g(j,k-b.min(d+1+f,e+1+h,a-d+f,c-e+h),[e,d]);return j};h.$FormationRectangle=function(f){var d=f.$Cols||1,e=f.$Rows||1,h=[],a,c,i;i=b.round(b.min(d/2,e/2))+1;for(a=0;a&lt;d;a++)for(c=0;c&lt;e;c++)g(h,i-b.min(a+1,c+1,d-a,e-c),[c,a]);return h};h.$FormationRandom=function(d){for(var e=[],a,c=0;c&lt;d.$Rows;c++)for(a=0;a&lt;d.$Cols;a++)g(e,b.ceil(1e5*b.random())%13,[c,a]);return e};h.$FormationCircle=function(d){for(var e=d.$Cols||1,f=d.$Rows||1,h=[],a,i=e/2-.5,j=f/2-.5,c=0;c&lt;e;c++)for(a=0;a&lt;f;a++)g(h,b.round(b.sqrt(b.pow(c-i,2)+b.pow(a-j,2))),[a,c]);return h};h.$FormationCross=function(d){for(var e=d.$Cols||1,f=d.$Rows||1,h=[],a,i=e/2-.5,j=f/2-.5,c=0;c&lt;e;c++)for(a=0;a&lt;f;a++)g(h,b.round(b.min(b.abs(c-i),b.abs(a-j))),[a,c]);return h};h.$FormationRectangleCross=function(f){for(var h=f.$Cols||1,i=f.$Rows||1,j=[],a,d=h/2-.5,e=i/2-.5,k=b.max(d,e)+1,c=0;c&lt;h;c++)for(a=0;a&lt;i;a++)g(j,b.round(k-b.max(d-b.abs(c-d),e-b.abs(a-e)))-1,[a,c]);return j}};h.$JssorSlideshowRunner$=function(o,s,q,t,y){var f=this,u,h,e,x=0,w=t.$TransitionsOrder,r,j=8;function m(h,f){var e={$Interval:f,$Duration:1,$Delay:0,$Cols:1,$Rows:1,$Opacity:0,$Zoom:0,$Clip:0,$Move:g,$SlideOut:g,$Reverse:g,$Formation:n.$FormationRandom,$Assembly:1032,$ChessMode:{$Column:0,$Row:0},$Easing:d.$EaseSwing,$Round:{},Rb:[],$During:{}};a.n(e,h);e.Xb=e.$Cols*e.$Rows;if(a.Ic(e.$Easing))e.$Easing={wb:e.$Easing};e.Fd=b.ceil(e.$Duration/e.$Interval);e.yd=function(b,a){b/=e.$Cols;a/=e.$Rows;var f=b+&quot;x&quot;+a;if(!e.Rb[f]){e.Rb[f]={hb:b,gb:a};for(var c=0;c&lt;e.$Cols;c++)for(var d=0;d&lt;e.$Rows;d++)e.Rb[f][d+&quot;,&quot;+c]={$Top:d*a,$Right:c*b+b,$Bottom:d*a+a,$Left:c*b}}return e.Rb[f]};if(e.$Brother){e.$Brother=m(e.$Brother,f);e.$SlideOut=c}return e}function p(A,i,d,v,n,l){var y=this,t,u={},j={},m=[],f,e,r,p=d.$ChessMode.$Column||0,q=d.$ChessMode.$Row||0,h=d.yd(n,l),o=B(d),C=o.length-1,s=d.$Duration+d.$Delay*C,w=v+s,k=d.$SlideOut,x;w+=50;function B(a){var b=a.$Formation(a);return a.$Reverse?b.reverse():b}y.Wc=w;y.Tb=function(c){c-=v;var e=c&lt;s;if(e||x){x=e;if(!k)c=s-c;var f=b.ceil(c/d.$Interval);a.e(j,function(c,e){var d=b.max(f,c.Wd);d=b.min(d,c.length-1);if(c.Pc!=d){if(!c.Pc&amp;&amp;!k)a.B(m[e]);else d==c.ae&amp;&amp;k&amp;&amp;a.J(m[e]);c.Pc=d;a.Nd(m[e],c[d])}})}};i=a.U(i);if(a.T()){var D=!i[&quot;no-image&quot;],z=a.mf(i);a.e(z,function(b){(D||b[&quot;jssor-slider&quot;])&amp;&amp;a.Ab(b,a.Ab(b),c)})}a.e(o,function(i,m){a.e(i,function(G){var K=G[0],J=G[1],v=K+&quot;,&quot;+J,o=g,s=g,x=g;if(p&amp;&amp;J%2){if(p&amp;3)o=!o;if(p&amp;12)s=!s;if(p&amp;16)x=!x}if(q&amp;&amp;K%2){if(q&amp;3)o=!o;if(q&amp;12)s=!s;if(q&amp;16)x=!x}d.$Top=d.$Top||d.$Clip&amp;4;d.$Bottom=d.$Bottom||d.$Clip&amp;8;d.$Left=d.$Left||d.$Clip&amp;1;d.$Right=d.$Right||d.$Clip&amp;2;var C=s?d.$Bottom:d.$Top,z=s?d.$Top:d.$Bottom,B=o?d.$Right:d.$Left,A=o?d.$Left:d.$Right;d.$Clip=C||z||B||A;r={};e={$Top:0,$Left:0,$Opacity:1,hb:n,gb:l};f=a.n({},e);t=a.n({},h[v]);if(d.$Opacity)e.$Opacity=2-d.$Opacity;if(d.$ZIndex){e.$ZIndex=d.$ZIndex;f.$ZIndex=0}var I=d.$Cols*d.$Rows&gt;1||d.$Clip;if(d.$Zoom||d.$Rotate){var H=c;if(a.T())if(d.$Cols*d.$Rows&gt;1)H=g;else I=g;if(H){e.$Zoom=d.$Zoom?d.$Zoom-1:1;f.$Zoom=1;if(a.T()||a.vc())e.$Zoom=b.min(e.$Zoom,2);var N=d.$Rotate;e.$Rotate=N*360*(x?-1:1);f.$Rotate=0}}if(I){if(d.$Clip){var w=d.$ScaleClip||1,i=t.xb={};if(C&amp;&amp;z){i.$Top=h.gb/2*w;i.$Bottom=-i.$Top}else if(C)i.$Bottom=-h.gb*w;else if(z)i.$Top=h.gb*w;if(B&amp;&amp;A){i.$Left=h.hb/2*w;i.$Right=-i.$Left}else if(B)i.$Right=-h.hb*w;else if(A)i.$Left=h.hb*w}r.$Clip=t;f.$Clip=h[v]}var L=o?1:-1,M=s?1:-1;if(d.x)e.$Left+=n*d.x*L;if(d.y)e.$Top+=l*d.y*M;a.e(e,function(b,c){if(a.Hc(b))if(b!=f[c])r[c]=b-f[c]});u[v]=k?f:e;var D=d.Fd,y=b.round(m*d.$Delay/d.$Interval);j[v]=new Array(y);j[v].Wd=y;j[v].ae=y+D-1;for(var F=0;F&lt;=D;F++){var E=a.vd(f,r,F/D,d.$Easing,d.$During,d.$Round,{$Move:d.$Move,$OriginalWidth:n,$OriginalHeight:l});E.$ZIndex=E.$ZIndex||1;j[v].push(E)}})});o.reverse();a.e(o,function(b){a.e(b,function(c){var f=c[0],e=c[1],d=f+&quot;,&quot;+e,b=i;if(e||f)b=a.U(i);a.H(b,u[d]);a.bb(b,&quot;hidden&quot;);a.D(b,&quot;absolute&quot;);A.Yd(b);m[d]=b;a.B(b,!k)})})}function v(){var a=this,b=0;k.call(a,0,u);a.Fb=function(c,a){if(a-b&gt;j){b=a;e&amp;&amp;e.Tb(a);h&amp;&amp;h.Tb(a)}};a.jb=r}f.Hd=function(){var a=0,c=t.$Transitions,d=c.length;if(w)a=x++%d;else a=b.floor(b.random()*d);c[a]&amp;&amp;(c[a].db=a);return c[a]};f.Rd=function(w,x,i,k,a){r=a;a=m(a,j);var g=k.bd,d=i.bd;g[&quot;no-image&quot;]=!k.Qb;d[&quot;no-image&quot;]=!i.Qb;var l=g,n=d,v=a,c=a.$Brother||m({},j);if(!a.$SlideOut){l=d;n=g}var t=c.$Shift||0;h=new p(o,n,c,b.max(t-c.$Interval,0),s,q);e=new p(o,l,v,b.max(c.$Interval-t,0),s,q);h.Tb(0);e.Tb(0);u=b.max(h.Wc,e.Wc);f.db=w};f.Eb=function(){o.Eb();h=i;e=i};f.Ud=function(){var a=i;if(e)a=new v;return a};if(a.T()||a.vc()||y&amp;&amp;a.uc()&lt;537)j=16;l.call(f);k.call(f,-1e7,1e7)};var f=h.$JssorSlider$=function(q,fc){var n=this;function Dc(){var a=this;k.call(a,-1e8,2e8);a.Dd=function(){var c=a.qb(),d=b.floor(c),f=t(d),e=c-b.floor(c);return{db:f,Vd:d,tb:e}};a.Fb=function(d,a){var e=b.floor(a);if(e!=a&amp;&amp;a&gt;d)e++;Tb(e,c);n.j(f.$EVT_POSITION_CHANGE,t(a),t(d),a,d)}}function Cc(){var b=this;k.call(b,0,0,{nd:s});a.e(C,function(a){D&amp;1&amp;&amp;a.Kd(s);b.kc(a);a.$Shift(hb/bc)})}function Bc(){var a=this,b=Sb.$Elmt;k.call(a,-1,2,{$Easing:d.$EaseLinear,Yb:{tb:Zb},nd:s},b,{tb:1},{tb:-2});a.Jb=b}function qc(m,l){var a=this,d,e,h,j,b;k.call(a,-1e8,2e8,{wd:100});a.xd=function(){P=c;T=i;n.j(f.$EVT_SWIPE_START,t(y.R()),y.R())};a.ed=function(){P=g;j=g;var a=y.Dd();n.j(f.$EVT_SWIPE_END,t(y.R()),y.R());!a.tb&amp;&amp;Fc(a.Vd,r)};a.Fb=function(g,f){var a;if(j)a=b;else{a=e;if(h){var c=f/h;a=p.$SlideEasing(c)*(e-d)+d}}y.v(a)};a.Kb=function(b,f,c,g){d=b;e=f;h=c;y.v(b);a.v(0);a.jd(c,g)};a.Id=function(d){j=c;b=d;a.$Play(d,i,c)};a.Ld=function(a){b=a};y=new Dc;y.W(m);y.W(l)}function rc(){var c=this,b=Xb();a.G(b,0);a.sb(b,&quot;pointerEvents&quot;,&quot;none&quot;);c.$Elmt=b;c.Yd=function(c){a.E(b,c);a.B(b)};c.Eb=function(){a.J(b);a.hc(b)}}function Ac(o,h){var d=this,q,x,K,y,j,B=[],G,u,V,H,P,F,e,w,m;k.call(d,-v,v+1,{});function E(a){x&amp;&amp;x.Pb();q&amp;&amp;q.Pb();U(o,a);F=c;q=new L.$Class(o,L,1);x=new L.$Class(o,L);x.v(0);q.v(0)}function X(){q.ic&lt;L.ic&amp;&amp;E()}function N(o,r,m){if(!H){H=c;if(j&amp;&amp;m){var e=m.width,b=m.height,l=e,k=b;if(e&amp;&amp;b&amp;&amp;p.$FillMode){if(p.$FillMode&amp;3&amp;&amp;(!(p.$FillMode&amp;4)||e&gt;J||b&gt;I)){var i=g,q=J/I*b/e;if(p.$FillMode&amp;1)i=q&gt;1;else if(p.$FillMode&amp;2)i=q&lt;1;l=i?e*I/b:J;k=i?I:b*J/e}a.k(j,l);a.l(j,k);a.z(j,(I-k)/2);a.C(j,(J-l)/2)}a.D(j,&quot;absolute&quot;);n.j(f.$EVT_LOAD_END,h)}}a.J(r);o&amp;&amp;o(d)}function W(b,c,e,f){if(f==T&amp;&amp;r==h&amp;&amp;Q)if(!Ec){var a=t(b);A.Rd(a,h,c,d,e);c.Ye();Z.Hb(a,1);Z.v(a);z.Kb(b,b,0)}}function bb(b){if(b==T&amp;&amp;r==h){if(!e){var a=i;if(A)if(A.db==h)a=A.Ud();else A.Eb();X();e=new xc(o,h,a,d.Ve(),d.Ke());e.Mc(m)}!e.$IsPlaying()&amp;&amp;e.mc()}}function S(f,c,g){if(f==h){if(f!=c)C[c]&amp;&amp;C[c].Ue();else!g&amp;&amp;e&amp;&amp;e.Xe();m&amp;&amp;m.$Enable();var j=T=a.K();d.rb(a.L(i,bb,j))}else{var l=b.abs(h-f),k=v+p.$LazyLoading-1;(!P||l&lt;=k)&amp;&amp;d.rb()}}function cb(){if(r==h&amp;&amp;e){e.fb();m&amp;&amp;m.$Quit();m&amp;&amp;m.$Disable();e.Kc()}}function fb(){r==h&amp;&amp;e&amp;&amp;e.fb()}function Y(a){!M&amp;&amp;n.j(f.$EVT_CLICK,h,a)}function O(){m=w.pInstance;e&amp;&amp;e.Mc(m)}d.rb=function(d,b){b=b||y;if(B.length&amp;&amp;!H){a.B(b);if(!V){V=c;n.j(f.$EVT_LOAD_START,h);a.e(B,function(b){if(!a.I(b,&quot;src&quot;)){b.src=a.u(b,&quot;src2&quot;);a.V(b,b[&quot;display-origin&quot;])}})}a.cf(B,j,a.L(i,N,d,b))}else N(d,b)};d.Ze=function(){if(A){var b=A.Hd(s);if(b){var e=T=a.K(),c=h+Wb,d=C[t(c)];return d.rb(a.L(i,W,c,d,b,e),y)}}ab(r+p.$AutoPlaySteps*Wb)};d.nc=function(){S(h,h,c)};d.Ue=function(){m&amp;&amp;m.$Quit();m&amp;&amp;m.$Disable();d.pd();e&amp;&amp;e.df();e=i;E()};d.Ye=function(){a.J(o)};d.pd=function(){a.B(o)};d.ef=function(){m&amp;&amp;m.$Enable()};function U(b,e,d){if(a.I(b,&quot;jssor-slider&quot;))return;d=d||0;if(!F){if(b.tagName==&quot;IMG&quot;){B.push(b);if(!a.I(b,&quot;src&quot;)){P=c;b[&quot;display-origin&quot;]=a.V(b);a.J(b)}}a.T()&amp;&amp;a.G(b,(a.G(b)||0)+1);if(p.$HWA&amp;&amp;a.uc())(a.uc()&lt;534||!eb&amp;&amp;!a.de())&amp;&amp;a.oe(b)}var f=a.P(b);a.e(f,function(f){var i=f.tagName,k=a.u(f,&quot;u&quot;);if(k==&quot;player&quot;&amp;&amp;!w){w=f;if(w.pInstance)O();else a.c(w,&quot;dataavailable&quot;,O)}if(k==&quot;caption&quot;){if(!a.ud()&amp;&amp;!e){var h=a.U(f,g,c);a.Nb(h,f,b);a.Db(f,b);f=h;e=c}}else if(!F&amp;&amp;!d&amp;&amp;!j){if(i==&quot;A&quot;){if(a.u(f,&quot;u&quot;)==&quot;image&quot;)j=a.of(f,&quot;IMG&quot;);else j=a.A(f,&quot;image&quot;,c);if(j){G=f;a.H(G,R);u=a.U(G,c);a.V(u,&quot;block&quot;);a.H(u,R);a.Ab(u,0);a.sb(u,&quot;backgroundColor&quot;,&quot;#000&quot;)}}else if(i==&quot;IMG&quot;&amp;&amp;a.u(f,&quot;u&quot;)==&quot;image&quot;)j=f;if(j){j.border=0;a.H(j,R)}}U(f,e,d+1)})}d.ec=function(c,b){var a=v-b;Zb(K,a)};d.Ve=function(){return q};d.Ke=function(){return x};d.db=h;l.call(d);var D=a.A(o,&quot;thumb&quot;,c);if(D){d.bf=a.U(D);a.Qc(D,&quot;id&quot;);a.J(D)}a.B(o);y=a.U(db);a.G(y,1e3);a.c(o,&quot;click&quot;,Y);E(c);d.Qb=j;d.Yc=u;d.bd=o;d.Jb=K=o;a.E(K,y);n.$On(203,S);n.$On(28,fb);n.$On(24,cb)}function xc(E,i,p,u,t){var b=this,l=0,w=0,m,h,d,e,j,q,v,s,o=C[i];k.call(b,0,0);function x(){a.hc(N);dc&amp;&amp;j&amp;&amp;o.Yc&amp;&amp;a.E(N,o.Yc);a.B(N,!j&amp;&amp;o.Qb)}function y(){if(q){q=g;n.j(f.$EVT_ROLLBACK_END,i,d,l,h,d,e);b.v(h)}b.mc()}function z(a){s=a;b.fb();b.mc()}b.mc=function(){var a=b.qb();if(!B&amp;&amp;!P&amp;&amp;!s&amp;&amp;r==i){if(!a){if(m&amp;&amp;!j){j=c;b.Kc(c);n.j(f.$EVT_SLIDESHOW_START,i,l,w,m,e)}x()}var g,p=f.$EVT_STATE_CHANGE;if(a!=e)if(a==d)g=e;else if(a==h)g=d;else if(!a)g=h;else if(a&gt;d){q=c;g=d;p=f.$EVT_ROLLBACK_START}else g=b.ld();n.j(p,i,a,l,h,d,e);var k=Q&amp;&amp;(!G||H);if(a==e)(d!=e&amp;&amp;!(G&amp;12)||k)&amp;&amp;o.Ze();else(k||a!=d)&amp;&amp;b.jd(g,y)}};b.Xe=function(){d==e&amp;&amp;d==b.qb()&amp;&amp;b.v(h)};b.df=function(){A&amp;&amp;A.db==i&amp;&amp;A.Eb();var a=b.qb();a&lt;e&amp;&amp;n.j(f.$EVT_STATE_CHANGE,i,-a-1,l,h,d,e)};b.Kc=function(b){p&amp;&amp;a.bb(jb,b&amp;&amp;p.jb.$Outside?&quot;&quot;:&quot;hidden&quot;)};b.ec=function(b,a){if(j&amp;&amp;a&gt;=m){j=g;x();o.pd();A.Eb();n.j(f.$EVT_SLIDESHOW_END,i,l,w,m,e)}n.j(f.$EVT_PROGRESS_CHANGE,i,a,l,h,d,e)};b.Mc=function(a){if(a&amp;&amp;!v){v=a;a.$On($JssorPlayer$.Xd,z)}};p&amp;&amp;b.kc(p);m=b.ib();b.ib();b.kc(u);h=u.ib();d=h+(a.tc(a.u(E,&quot;idle&quot;))||pc);t.$Shift(d);b.W(t);e=b.ib()}function Zb(g,f){var e=w&gt;0?w:ib,c=Bb*f*(e&amp;1),d=Cb*f*(e&gt;&gt;1&amp;1);c=b.round(c);d=b.round(d);a.C(g,c);a.z(g,d)}function Ob(){qb=P;Kb=z.ld();E=y.R()}function gc(){Ob();if(B||!H&amp;&amp;G&amp;12){z.fb();n.j(f.ce)}}function ec(e){if(!B&amp;&amp;(H||!(G&amp;12))&amp;&amp;!z.$IsPlaying()){var c=y.R(),a=b.ceil(E);if(e&amp;&amp;b.abs(F)&gt;=p.$MinDragOffsetToSlide){a=b.ceil(c);a+=gb}if(!(D&amp;1))a=b.min(s-v,b.max(a,0));var d=b.abs(a-c);d=1-b.pow(1-d,5);if(!M&amp;&amp;qb)z.Td(Kb);else if(c==a){ub.ef();ub.nc()}else z.Kb(c,a,d*Ub)}}function Ib(b){!a.u(a.rc(b),&quot;nodrag&quot;)&amp;&amp;a.Ib(b)}function uc(a){Yb(a,1)}function Yb(b,d){b=a.kd(b);var k=a.rc(b);if(!K&amp;&amp;!a.u(k,&quot;nodrag&quot;)&amp;&amp;vc()&amp;&amp;(!d||b.touches.length==1)){B=c;Ab=g;T=i;a.c(e,d?&quot;touchmove&quot;:&quot;mousemove&quot;,Db);a.K();M=0;gc();if(!qb)w=0;if(d){var j=b.touches[0];vb=j.clientX;wb=j.clientY}else{var h=a.md(b);vb=h.x;wb=h.y}F=0;cb=0;gb=0;n.j(f.$EVT_DRAG_START,t(E),E,b)}}function Db(e){if(B){e=a.kd(e);var f;if(e.type!=&quot;mousemove&quot;){var l=e.touches[0];f={x:l.clientX,y:l.clientY}}else f=a.md(e);if(f){var j=f.x-vb,k=f.y-wb;if(b.floor(E)!=E)w=w||ib&amp;K;if((j||k)&amp;&amp;!w){if(K==3)if(b.abs(k)&gt;b.abs(j))w=2;else w=1;else w=K;if(lb&amp;&amp;w==1&amp;&amp;b.abs(k)-b.abs(j)&gt;3)Ab=c}if(w){var d=k,i=Cb;if(w==1){d=j;i=Bb}if(!(D&amp;1)){if(d&gt;0){var g=i*r,h=d-g;if(h&gt;0)d=g+b.sqrt(h)*5}if(d&lt;0){var g=i*(s-v-r),h=-d-g;if(h&gt;0)d=-g-b.sqrt(h)*5}}if(F-cb&lt;-2)gb=0;else if(F-cb&gt;2)gb=-1;cb=F;F=d;tb=E-F/i/(Y||1);if(F&amp;&amp;w&amp;&amp;!Ab){a.Ib(e);if(!P)z.Id(tb);else z.Ld(tb)}}}}}function ob(){sc();if(B){B=g;a.K();a.M(e,&quot;mousemove&quot;,Db);a.M(e,&quot;touchmove&quot;,Db);M=F;z.fb();var b=y.R();n.j(f.$EVT_DRAG_END,t(b),b,t(E),E);G&amp;12&amp;&amp;Ob();ec(c)}}function kc(c){if(M){a.af(c);var b=a.rc(c);while(b&amp;&amp;u!==b){b.tagName==&quot;A&quot;&amp;&amp;a.Ib(c);try{b=b.parentNode}catch(d){break}}}}function oc(a){C[r];r=t(a);ub=C[r];Tb(a);return r}function Fc(a,b){w=0;oc(a);n.j(f.$EVT_PARK,t(a),b)}function Tb(b,c){yb=b;a.e(O,function(a){a.yc(t(b),b,c)})}function vc(){var b=f.Zc||0,a=X;if(lb)a&amp;1&amp;&amp;(a&amp;=1);f.Zc|=a;return K=a&amp;~b}function sc(){if(K){f.Zc&amp;=~X;K=0}}function Xb(){var b=a.ab();a.H(b,R);a.D(b,&quot;absolute&quot;);return b}function t(a){return(a%s+s)%s}function lc(a,c){if(c)if(!D){a=b.min(b.max(a+yb,0),s-v);c=g}else if(D&amp;2){a=t(a+yb);c=g}ab(a,p.$SlideDuration,c)}function zb(){a.e(O,function(a){a.zc(a.Sb.$ChanceToShow&lt;=H)})}function ic(){if(!H){H=1;zb();if(!B){G&amp;12&amp;&amp;ec();G&amp;3&amp;&amp;C[r].nc()}}}function hc(){if(H){H=0;zb();B||!(G&amp;12)||gc()}}function jc(){R={hb:J,gb:I,$Top:0,$Left:0};a.e(U,function(b){a.H(b,R);a.D(b,&quot;absolute&quot;);a.bb(b,&quot;hidden&quot;);a.J(b)});a.H(db,R)}function nb(b,a){ab(b,a,c)}function ab(f,e,k){if(Qb&amp;&amp;(!B||p.$NaviQuitDrag)){P=c;B=g;z.fb();if(e==j)e=Ub;var d=Eb.qb(),a=f;if(k){a=d+f;if(f&gt;0)a=b.ceil(a);else a=b.floor(a)}if(D&amp;2)a=t(a);if(!(D&amp;1))a=b.max(0,b.min(a,s-v));var i=(a-d)%s;a=d+i;var h=d==a?0:e*b.abs(i);h=b.min(h,e*v*1.5);z.Kb(d,a,h||1)}}n.$PlayTo=ab;n.$GoTo=function(a){ab(a,1)};n.$Next=function(){nb(1)};n.$Prev=function(){nb(-1)};n.$Pause=function(){Q=g};n.$Play=function(){if(!Q){Q=c;C[r]&amp;&amp;C[r].nc()}};n.$SetSlideshowTransitions=function(a){p.$SlideshowOptions.$Transitions=a};n.$SetCaptionTransitions=function(b){L.$CaptionTransitions=b;L.ic=a.K()};n.$SlidesCount=function(){return U.length};n.$CurrentIndex=function(){return r};n.$IsAutoPlaying=function(){return Q};n.$IsDragging=function(){return B};n.$IsSliding=function(){return P};n.$IsMouseOver=function(){return!H};n.$LastDragSucceded=function(){return M};function W(){return a.k(x||q)}function kb(){return a.l(x||q)}n.$OriginalWidth=n.$GetOriginalWidth=W;n.$OriginalHeight=n.$GetOriginalHeight=kb;function Gb(c,d){if(c==j)return a.k(q);if(!x){var b=a.ab(e);a.Rc(b,a.Rc(q));a.Gb(b,a.Gb(q));a.V(b,&quot;block&quot;);a.D(b,&quot;relative&quot;);a.z(b,0);a.C(b,0);a.bb(b,&quot;visible&quot;);x=a.ab(e);a.D(x,&quot;absolute&quot;);a.z(x,0);a.C(x,0);a.k(x,a.k(q));a.l(x,a.l(q));a.me(x,&quot;0 0&quot;);a.E(x,b);var h=a.P(q);a.E(q,x);a.sb(q,&quot;backgroundImage&quot;,&quot;&quot;);a.e(h,function(c){a.E(a.u(c,&quot;noscale&quot;)?q:b,c)})}Y=c/(d?a.l:a.k)(x);a.le(x,Y);var g=d?Y*W():c,f=d?c:Y*kb();a.k(q,g);a.l(q,f);a.e(O,function(a){a.gc(g,f)})}n.$ScaleHeight=n.$GetScaleHeight=function(b){if(b==j)return a.l(q);Gb(b,c)};n.$ScaleWidth=n.$SetScaleWidth=n.$GetScaleWidth=Gb;n.sd=function(a){var d=b.ceil(t(hb/bc)),c=t(a-r+d);if(c&gt;v){if(a-r&gt;s/2)a-=s;else if(a-r&lt;=-s/2)a+=s}else a=r+c-d;return a};l.call(n);n.$Elmt=q=a.Z(q);var p=a.n({$FillMode:0,$LazyLoading:1,$StartIndex:0,$AutoPlay:g,$Loop:1,$HWA:c,$NaviQuitDrag:c,$AutoPlaySteps:1,$AutoPlayInterval:3e3,$PauseOnHover:1,$SlideDuration:500,$SlideEasing:d.$EaseOutQuad,$MinDragOffsetToSlide:20,$SlideSpacing:0,$DisplayPieces:1,$ParkingPosition:0,$UISearchMode:1,$PlayOrientation:1,$DragOrientation:1},fc);if(p.$Idle!=j)p.$AutoPlayInterval=p.$Idle;if(p.$Cols!=j)p.$DisplayPieces=p.$Cols;var ib=p.$PlayOrientation&amp;3,Wb=(p.$PlayOrientation&amp;4)/-4||1,fb=p.$SlideshowOptions,L=a.n({$Class:o,$PlayInMode:1,$PlayOutMode:1},p.$CaptionSliderOptions),rb=p.$BulletNavigatorOptions,V=p.$ArrowNavigatorOptions,bb=p.$ThumbnailNavigatorOptions,S=!p.$UISearchMode,x,u=a.A(q,&quot;slides&quot;,S),db=a.A(q,&quot;loading&quot;,S)||a.ab(e),Jb=a.A(q,&quot;navigator&quot;,S),cc=a.A(q,&quot;arrowleft&quot;,S),ac=a.A(q,&quot;arrowright&quot;,S),Hb=a.A(q,&quot;thumbnavigator&quot;,S),nc=a.k(u),mc=a.l(u),R,U=[],wc=a.P(u);a.e(wc,function(b){if(b.tagName==&quot;DIV&quot;&amp;&amp;!a.u(b,&quot;u&quot;))U.push(b);else a.T()&amp;&amp;a.G(b,(a.G(b)||0)+1)});var r=-1,yb,ub,s=U.length,J=p.$SlideWidth||nc,I=p.$SlideHeight||mc,Vb=p.$SlideSpacing,Bb=J+Vb,Cb=I+Vb,bc=ib&amp;1?Bb:Cb,v=b.min(p.$DisplayPieces,s),jb,w,K,Ab,O=[],Pb,Rb,Nb,dc,Ec,Q,G=p.$PauseOnHover,pc=p.$AutoPlayInterval,Ub=p.$SlideDuration,sb,eb,hb,Qb=v&lt;s,D=Qb?p.$Loop:0,X,M,H=1,P,B,T,vb=0,wb=0,F,cb,gb,Eb,y,Z,z,Sb=new rc,Y;Q=p.$AutoPlay;n.Sb=fc;jc();a.I(q,&quot;jssor-slider&quot;,c);a.G(u,a.G(u)||0);a.D(u,&quot;absolute&quot;);jb=a.U(u,c);a.Nb(jb,u);if(fb){dc=fb.$ShowLink;sb=fb.$Class;eb=v==1&amp;&amp;s&gt;1&amp;&amp;sb&amp;&amp;(!a.ud()||a.cd()&gt;=8)}hb=eb||v&gt;=s||!(D&amp;1)?0:p.$ParkingPosition;X=(v&gt;1||hb?ib:-1)&amp;p.$DragOrientation;var xb=u,C=[],A,N,Fb=a.ge(),lb=Fb.he,E,qb,Kb,tb;Fb.od&amp;&amp;a.sb(xb,Fb.od,([i,&quot;pan-y&quot;,&quot;pan-x&quot;,&quot;none&quot;])[X]||&quot;&quot;);Z=new Bc;if(eb)A=new sb(Sb,J,I,fb,lb);a.E(jb,Z.Jb);a.bb(u,&quot;hidden&quot;);N=Xb();a.sb(N,&quot;backgroundColor&quot;,&quot;#000&quot;);a.Ab(N,0);a.Nb(N,xb.firstChild,xb);for(var pb=0;pb&lt;U.length;pb++){var yc=U[pb],zc=new Ac(yc,pb);C.push(zc)}a.J(db);Eb=new Cc;z=new qc(Eb,Z);if(X){a.c(u,&quot;mousedown&quot;,Yb);a.c(u,&quot;touchstart&quot;,uc);a.c(u,&quot;dragstart&quot;,Ib);a.c(u,&quot;selectstart&quot;,Ib);a.c(e,&quot;mouseup&quot;,ob);a.c(e,&quot;touchend&quot;,ob);a.c(e,&quot;touchcancel&quot;,ob);a.c(h,&quot;blur&quot;,ob)}G&amp;=lb?10:5;if(Jb&amp;&amp;rb){Pb=new rb.$Class(Jb,rb,W(),kb());O.push(Pb)}if(V&amp;&amp;cc&amp;&amp;ac){V.$Loop=D;V.$DisplayPieces=v;Rb=new V.$Class(cc,ac,V,W(),kb());O.push(Rb)}if(Hb&amp;&amp;bb){bb.$StartIndex=p.$StartIndex;Nb=new bb.$Class(Hb,bb);O.push(Nb)}a.e(O,function(a){a.fc(s,C,db);a.$On(m.Ub,lc)});Gb(W());a.c(u,&quot;click&quot;,kc);a.c(q,&quot;mouseout&quot;,a.Ob(ic,q));a.c(q,&quot;mouseover&quot;,a.Ob(hc,q));zb();p.$ArrowKeyNavigation&amp;&amp;a.c(e,&quot;keydown&quot;,function(a){if(a.keyCode==37)nb(-1);else a.keyCode==39&amp;&amp;nb(1)});var mb=p.$StartIndex;if(!(D&amp;1))mb=b.max(0,b.min(mb,s-v));z.Kb(mb,mb,0)};h.$JssorSlideo$=f;f.$EVT_CLICK=21;f.$EVT_DRAG_START=22;f.$EVT_DRAG_END=23;f.$EVT_SWIPE_START=24;f.$EVT_SWIPE_END=25;f.$EVT_LOAD_START=26;f.$EVT_LOAD_END=27;f.ce=28;f.$EVT_POSITION_CHANGE=202;f.$EVT_PARK=203;f.$EVT_SLIDESHOW_START=206;f.$EVT_SLIDESHOW_END=207;f.$EVT_PROGRESS_CHANGE=208;f.$EVT_STATE_CHANGE=209;f.$EVT_ROLLBACK_START=210;f.$EVT_ROLLBACK_END=211;var m={Ub:1};h.$JssorBulletNavigator$=function(d,D){var f=this;l.call(f);d=a.Z(d);var t,u,s,r,n=0,e,o,k,y,z,j,h,q,p,C=[],A=[];function x(a){a!=-1&amp;&amp;A[a].Ec(a==n)}function v(a){f.j(m.Ub,a*o)}f.$Elmt=d;f.yc=function(a){if(a!=r){var d=n,c=b.floor(a/o);n=c;r=a;x(d);x(c)}};f.zc=function(b){a.B(d,b)};var B;f.gc=function(f,b){if(!B||e.$Scale==g){var f=a.zb(d).clientWidth,b=a.zb(d).clientHeight;e.$AutoCenter&amp;1&amp;&amp;a.C(d,(f-u)/2);e.$AutoCenter&amp;2&amp;&amp;a.z(d,(b-s)/2);B=c}};var w;f.fc=function(D){if(!w){t=b.ceil(D/o);n=0;var m=q+y,r=p+z,l=b.ceil(t/k)-1;u=q+m*(!j?l:k-1);s=p+r*(j?l:k-1);a.k(d,u);a.l(d,s);for(var f=0;f&lt;t;f++){var B=a.Re();a.ff(B,f+1);var g=a.Dc(h,&quot;numbertemplate&quot;,B,c);a.D(g,&quot;absolute&quot;);var x=f%(l+1);a.C(g,!j?m*x:f%k*m);a.z(g,j?r*x:b.floor(f/(l+1))*r);a.E(d,g);C[f]=g;e.$ActionMode&amp;1&amp;&amp;a.c(g,&quot;click&quot;,a.L(i,v,f));e.$ActionMode&amp;2&amp;&amp;a.c(g,&quot;mouseover&quot;,a.Ob(a.L(i,v,f),g));A[f]=a.Mb(g)}w=c}};f.Sb=e=a.n({$SpacingX:0,$SpacingY:0,$Orientation:1,$ActionMode:1},D);h=a.A(d,&quot;prototype&quot;);q=a.k(h);p=a.l(h);a.Db(h,d);o=e.$Steps||1;k=e.$Lanes||1;y=e.$SpacingX;z=e.$SpacingY;j=e.$Orientation-1;e.$Scale==g&amp;&amp;a.I(d,&quot;noscale&quot;,c)};h.$JssorArrowNavigator$=function(b,f,j){var d=this;l.call(d);var u,t,e,h,k,q=a.k(b),o=a.l(b);function n(a){d.j(m.Ub,a,c)}function r(c){a.B(b,c||!j.$Loop&amp;&amp;e==0);a.B(f,c||!j.$Loop&amp;&amp;e&gt;=t-j.$DisplayPieces);u=c}d.yc=function(b,a,c){if(c)e=a;else{e=b;r(u)}};d.zc=r;var s;d.gc=function(i,d){if(!s||h.$Scale==g){var e=a.zb(b).clientWidth,d=a.zb(b).clientHeight;if(h.$AutoCenter&amp;1){a.C(b,(e-q)/2);a.C(f,(e-q)/2)}if(h.$AutoCenter&amp;2){a.z(b,(d-o)/2);a.z(f,(d-o)/2)}s=c}};var p;d.fc=function(d){t=d;e=0;if(!p){a.c(b,&quot;click&quot;,a.L(i,n,-k));a.c(f,&quot;click&quot;,a.L(i,n,k));a.Mb(b);a.Mb(f);p=c}};d.Sb=h=a.n({$Steps:1},j);k=h.$Steps;if(h.$Scale==g){a.I(b,&quot;noscale&quot;,c);a.I(f,&quot;noscale&quot;,c)}};h.$JssorThumbnailNavigator$=function(k,B){var i=this,y,p,d,v=[],z,x,e,q,r,u,t,o,s,h,n;l.call(i);k=a.Z(k);function A(l,f){var g=this,b,k,j;function o(){k.Ec(p==f)}function h(){if(!s.$LastDragSucceded()){var a=e-f%e,b=s.sd((f+a)/e-1),c=b*e+e-a;i.j(m.Ub,c)}}g.db=f;g.Jc=o;j=l.bf||l.Qb||a.ab();g.Jb=b=a.Dc(n,&quot;thumbnailtemplate&quot;,j,c);k=a.Mb(b);d.$ActionMode&amp;1&amp;&amp;a.c(b,&quot;click&quot;,h);d.$ActionMode&amp;2&amp;&amp;a.c(b,&quot;mouseover&quot;,a.Ob(h,b))}i.yc=function(c,d,f){var a=p;p=c;a!=-1&amp;&amp;v[a].Jc();v[c].Jc();!f&amp;&amp;s.$PlayTo(s.sd(b.floor(d/e)))};i.zc=function(b){a.B(k,b)};i.gc=a.jc;var w;i.fc=function(F,D){if(!w){y=F;b.ceil(y/e);p=-1;o=b.min(o,D.length);var i=d.$Orientation&amp;1,m=u+(u+q)*(e-1)*(1-i),l=t+(t+r)*(e-1)*i,B=m+(m+q)*(o-1)*i,n=l+(l+r)*(o-1)*(1-i);a.D(h,&quot;absolute&quot;);a.bb(h,&quot;hidden&quot;);d.$AutoCenter&amp;1&amp;&amp;a.C(h,(z-B)/2);d.$AutoCenter&amp;2&amp;&amp;a.z(h,(x-n)/2);a.k(h,B);a.l(h,n);var j=[];a.e(D,function(l,f){var g=new A(l,f),d=g.Jb,c=b.floor(f/e),k=f%e;a.C(d,(u+q)*k*(1-i));a.z(d,(t+r)*k*i);if(!j[c]){j[c]=a.ab();a.E(h,j[c])}a.E(j[c],d);v.push(g)});var E=a.n({$HWA:g,$AutoPlay:g,$NaviQuitDrag:g,$SlideWidth:m,$SlideHeight:l,$SlideSpacing:q*i+r*(1-i),$MinDragOffsetToSlide:12,$SlideDuration:200,$PauseOnHover:1,$PlayOrientation:d.$Orientation,$DragOrientation:d.$DisableDrag?0:d.$Orientation},d);s=new f(k,E);w=c}};i.Sb=d=a.n({$SpacingX:3,$SpacingY:3,$DisplayPieces:1,$Orientation:1,$AutoCenter:3,$ActionMode:1},B);if(d.$Rows!=j)d.$Lanes=d.$Rows;z=a.k(k);x=a.l(k);h=a.A(k,&quot;slides&quot;,c);n=a.A(h,&quot;prototype&quot;);u=a.k(n);t=a.l(n);a.Db(n,h);e=d.$Lanes||1;q=d.$SpacingX;r=d.$SpacingY;o=d.$DisplayPieces;d.$Scale==g&amp;&amp;a.I(k,&quot;noscale&quot;,c)};function o(){k.call(this,0,0);this.Pb=a.jc}h.$JssorCaptionSlider$=function(p,h,f){var c=this,g,n=f?h.$PlayInMode:h.$PlayOutMode,e=h.$CaptionTransitions,o={jb:&quot;t&quot;,$Delay:&quot;d&quot;,$Duration:&quot;du&quot;,x:&quot;x&quot;,y:&quot;y&quot;,$Rotate:&quot;r&quot;,$Zoom:&quot;z&quot;,$Opacity:&quot;f&quot;,X:&quot;b&quot;},d={wb:function(b,a){if(!isNaN(a.ob))b=a.ob;else b*=a.ye;return b},$Opacity:function(b,a){return this.wb(b-1,a)}};d.$Zoom=d.$Opacity;k.call(c,0,0);function l(r,m){var k=[],i,j=[],c=[];function h(c,d){var b={};a.e(o,function(g,h){var e=a.u(c,g+(d||&quot;&quot;));if(e){var f={};if(g==&quot;t&quot;)f.ob=e;else if(e.indexOf(&quot;%&quot;)+1)f.ye=a.tc(e)/100;else f.ob=a.tc(e);b[h]=f}});return b}function p(){return e[b.floor(b.random()*e.length)]}function g(f){var h;if(f==&quot;*&quot;)h=p();else if(f){var d=e[a.Ne(f)]||e[f];if(a.Zb(d)){if(f!=i){i=f;c[f]=0;j[f]=d[b.floor(b.random()*d.length)]}else c[f]++;d=j[f];if(a.Zb(d)){d=d.length&amp;&amp;d[c[f]%d.length];if(a.Zb(d))d=d[b.floor(b.random()*d.length)]}}h=d;if(a.fd(h))h=g(h)}return h}var q=a.P(r);a.e(q,function(b){var c=[];c.$Elmt=b;var e=a.u(b,&quot;u&quot;)==&quot;caption&quot;;a.e(f?[0,3]:[2],function(k,o){if(e){var j,f;if(k!=2||!a.u(b,&quot;t3&quot;)){f=h(b,k);if(k==2&amp;&amp;!f.jb){f.$Delay=f.$Delay||{ob:0};f=a.n(h(b,0),f)}}if(f&amp;&amp;f.jb){j=g(f.jb.ob);if(j){var i=a.n({$Delay:0},j);a.e(f,function(c,a){var b=(d[a]||d.wb).apply(d,[i[a],f[a]]);if(!isNaN(b))i[a]=b});if(!o)if(f.X)i.X=f.X.ob||0;else if(n&amp;2)i.X=0}}c.push(i)}if(m%2&amp;&amp;!o)c.P=l(b,m+1)});k.push(c)});return k}function m(w,c,z){var g={$Easing:c.$Easing,$Round:c.$Round,$During:c.$During,$Reverse:f&amp;&amp;!z},m=w,r=a.zb(w),l=a.k(m),j=a.l(m),y=a.k(r),x=a.l(r),h={},e={},i=c.$ScaleClip||1;if(c.$Opacity)e.$Opacity=1-c.$Opacity;g.$OriginalWidth=l;g.$OriginalHeight=j;if(c.$Zoom||c.$Rotate){e.$Zoom=(c.$Zoom||2)-2;if(a.T()||a.vc())e.$Zoom=b.min(e.$Zoom,1);h.$Zoom=1;var B=c.$Rotate||0;e.$Rotate=B*360;h.$Rotate=0}else if(c.$Clip){var s={$Top:0,$Right:l,$Bottom:j,$Left:0},v=a.n({},s),d=v.xb={},u=c.$Clip&amp;4,p=c.$Clip&amp;8,t=c.$Clip&amp;1,q=c.$Clip&amp;2;if(u&amp;&amp;p){d.$Top=j/2*i;d.$Bottom=-d.$Top}else if(u)d.$Bottom=-j*i;else if(p)d.$Top=j*i;if(t&amp;&amp;q){d.$Left=l/2*i;d.$Right=-d.$Left}else if(t)d.$Right=-l*i;else if(q)d.$Left=l*i;g.$Move=c.$Move;e.$Clip=v;h.$Clip=s}var n=0,o=0;if(c.x)n-=y*c.x;if(c.y)o-=x*c.y;if(n||o||g.$Move){e.$Left=n;e.$Top=o}var A=c.$Duration;h=a.n(h,a.zd(m,e));g.Yb=a.Od();return new k(c.$Delay,A,g,m,h,e)}function i(b,d){a.e(d,function(a){var e,h=a.$Elmt,d=a[0],k=a[1];if(d){e=m(h,d);b=e.Hb(d.X==j?b:d.X,1)}b=i(b,a.P);if(k){var f=m(h,k,1);f.Hb(b,1);c.W(f);g.W(f)}e&amp;&amp;c.W(e)});return b}c.Pb=function(){c.v(c.ib()*(f||0));g.v(0)};g=new k(0,0);i(0,n?l(p,1):[])};})(window,document,Math,null,true,false)</td>
      </tr>
</table>

  </div>

</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="btn">Go</button>
</form></div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2015 <span title="0.03331s from github-fe133-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact</a></li>
    </ul>
  </div>
</div>


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-suggester-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="fullscreen-contents js-fullscreen-contents" placeholder=""></textarea>
      <div class="suggester-container">
        <div class="suggester fullscreen-suggester js-suggester js-navigation-container"></div>
      </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped tooltipped-w" aria-label="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped tooltipped-w"
      aria-label="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    

    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-x flash-close js-ajax-error-dismiss" aria-label="Dismiss error"></a>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-5c08de317e4054ec200d36d3b1361ddd3cb30c05c9070a9d72862ee28ab1d7f9.js"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github/index-b79817a43c4618022b9ecd18dadd96010ccecbb12b56fcc232664db1f897e3a8.js"></script>
      
      

  </body>
</html>

