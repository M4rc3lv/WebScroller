
function onGotDown(t) {
 for(var i=0; i<t.length; i++) { 
  if(t[i].active) {   
   browser.tabs.update(t[i-1].id, {active: true})
   break;
  }  
 }
}

function onGotUp(t) {
 for(var i=0; i<t.length; i++) {  
  if(t[i].active) {   
   browser.tabs.update(t[i+1].id, {active: true})
   break;
  }  
 }
}

function onError(error) {
  console.log(`Error: ${error}`);
}

browser.commands.onCommand.addListener((command) => {  
 var q = browser.tabs.query({pinned:false});
 if(command=="tab-up") 
  q.then(onGotUp, onError);
 else if(command=="tab-down")
  q.then(onGotDown, onError);
});
