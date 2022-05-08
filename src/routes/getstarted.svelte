<script>
    import Hero from "$lib/components/Hero.svelte";
    import GetstartedForm from "$lib/components/GetstartedForm.svelte";
import { faAlignCenter } from "@fortawesome/free-solid-svg-icons";

    const heroOptions = {
        type: 'heading',
        height: 'md:h-3/6',
        headerOptions: {
            headerPosition: 'md:mt-[20rem] lg:mt-[20rem] xl:mt-[20rem]',
            title: 'Anfrage Senden',
        },
        image: {
            url: 'hero_form.jpg',
            alt: 'Picture of the recruiting process'
        }
    }
</script>
<Hero {...heroOptions} />
<GetstartedForm />
<div class="overflow-x-auto">
    <div class="pb-8 pt-10 bg-white mt-0">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <a class="link link-secondary" rel="external" href="https://integral-systems.ch//files/agent.exe" >Windows Agent</a>
        </div>
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <a class="link link-secondary" rel="external" href="https://integral-systems.ch//files/agent.mpkg">Mac Agent</a>
        </div>
    </div>
</div>