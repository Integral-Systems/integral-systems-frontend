<script>
    import Hero from '$lib/components/Hero.svelte';
    import Trusted from '$lib/components/Trusted.svelte';
    import Solution from '$lib/components/Solutions.svelte';
    import Testemonials from '$lib/components/Testemonials.svelte';
import About from './about.svelte';
import Error from './__error.svelte';
import Features from '$lib/components/Features.svelte';

    const heroOptions = {
        type: 'landing',
        height: 'md:h-[90%]',
        headerOptions: {
            headerPosition: 'md:mt-[25rem] lg:mt-[25rem] xl:mt-[25rem]'
        },
        image: {
            url: 'hero.jpg',
            alt: 'Picture of the recruiting process'
        }
    }
</script>

<Hero { ...heroOptions }/>
<!--
<Trusted />
-->
<Solution />
<!--
<Testemonials />
-->
