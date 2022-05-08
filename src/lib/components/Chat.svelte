<LibLoader url="https://app.chaport.com/javascripts/insert.js"
on:loaded="{onLoaded}" />

<script>
    import LibLoader from './LibLoader.svelte';
	import { onMount, createEventDispatcher } from 'svelte';
    import { browser } from "$app/env";

    function onLoaded() {
        console.log(window.chatport)
        
        window.chaportConfig = { 
            appId : '627805c47489e7c5d08f9289',
        };
    }

	onMount(async () => {
		if (browser) {
            (function(w,d,v3){
                w.chaportConfig = {
                appId : '627805c47489e7c5d08f9289'
                };
                if(w.chaport)return;v3=w.chaport={};v3._q=[];v3._l={};v3.q=function(){v3._q.push(arguments)};v3.on=function(e,fn){if(!v3._l[e])v3._l[e]=[];v3._l[e].push(fn)};var s=d.createElement('script');s.type='text/javascript';s.async=true;s.src='https://app.chaport.com/javascripts/insert.js';var ss=d.getElementsByTagName('script')[0];ss.parentNode.insertBefore(s,ss)})(window, document);
        }
	});
</script>