<script>
	import { onMount } from 'svelte';
    import { browser } from "$app/env";

	onMount(async () => {
		if (browser) {
            window.chaportConfig = { 
                appId : '627805c47489e7c5d08f9289',
                openIn: '_blank',
                autoStart: false
            };
        }
	});
</script>