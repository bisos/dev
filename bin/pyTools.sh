#!/bin/bash

IcmBriefDescription="Most basic smoke test to verify that lib updates have not caused harm."

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
### Args: :control "enabled|disabled|hide|release|fVar"  :vc "cvs|git|nil" :partof "bystar|nil" :copyleft "halaal+minimal|halaal+brief|nil"
typeset RcsId="$Id: dblock-iim-bash.el,v 1.4 2017-02-08 06:42:32 lsipusr Exp $"
# *CopyLeft*
__copying__="
* Libre-Halaal Software"
#  This is part of ByStar Libre Services. http://www.by-star.net
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] |
"
FILE="
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/dev/bin/pyTools.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@"
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]]
####+END:
_CommentEnd_

_CommentBegin_
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.)
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/git/fullUsagePanel-en.org::Xref-VersionControlGit][Panel Roadmap Documentation]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Module Description:]*
Typically not used directly but through -niche.sh.
** For example to add a github ssh config section keep the priv key in the usgBpo and point to it with keysBasePath.
** -i usgCustomFullUpdate sshConfLabel keysBasePath sshDestServer sshUser sshPort
_EOF_
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

# . ${opBinBase}/bystarCentralAcct.libSh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bpo_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/niche_lib.sh

. ${opBinBase}/usgBpos_lib.sh

# ./platformBases_lib.sh
. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/bisosPyVenv_lib.sh


# PRE parameters
typeset -t pyEnv="default"

function G_postParamHook {
    return
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Examples
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo="
    typeset runInfo="-p ri=lsipusr:passive"

    lpCurrentsGet
    
    #typeset examplesInfo="${extraInfo} ${runInfo}"
    typeset examplesInfo="${extraInfo}"

    local oneBxoId=${currentBxoId}
    #local oneGitBxSeLn="git.bysource.org"

    local oneUsg=${currentUsgUname}

    local oneBxosBase="/bisos/var/bxo/construct"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "General Pip Facilities" )
pip freeze
pip list
pip list --outdated
pip search .
pip search . | egrep -B1 'INSTALLED|LATEST'
$( examplesSeperatorChapter "Package Manipulations" )
pip show ${onePipPkg}
pip show jedi | egrep '^Version' | cut -d ':' -f 2
pip uninstall ${onePipPkg}
pip install ${onePipPkg}
pip install --upgrade ${onePipPkg}
$( examplesSeperatorChapter "PYPI" )
https://pypi.python.org/pypi/
yolk -l
NOTYET, ABSORB THESE
pipreqs --force .
johnnydep -v 0 $pypiPkgName
pipdeptree -r -p $pypiPkgName # Needs a virtEnv
pipdeptree -fl -p $pypiPkgName # Needs a virtEnv
yolk -U $pypiPkgName # show if update available at PyPI
NOTYET: Point to calltree generation, classbrowsers, etc
_EOF_

}

noArgsHook() {
  vis_examples
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Full Actions
_CommentEnd_


function vis_placeHolder {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** With the specified basic test ICMs.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}



_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Access, Verfications and Tests
_CommentEnd_


####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
