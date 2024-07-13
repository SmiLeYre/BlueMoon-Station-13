<!-- This should be copy-pasted into the root of your module folder as readme.md -->

https://github.com/NovaSector/NovaSector/pull/<!--PR Number-->

## \<Дополнительные слоты инвентаря> <!--Title of your addition.-->

Module ID: bluemoon_inventory_slots <!-- Uppercase, UNDERSCORE_CONNECTED name of your module, that you use to mark files. This is so people can case-sensitive search for your edits, if any. -->

### Description:

PR добавляет дополнительные секции инвентаря, в текущей итерации слот на плечи, куда теперь можно повесить накидки (cloaks), освобождая слот шеи для галстуков, ожерелий, ошейников и прочего, что более логично вяжется с шеей.
<!-- Here, try to describe what your PR does, what features it provides and any other directly useful information. -->

### TG Proc/File Changes:

- `code\datums\diseases\_MobProcs.dm`:
	`/mob/living/carbon/ContactContractDisease`

- `code\game\atoms.dm`:
	`/mob/living/carbon/human/add_blood_DNA`

- `code\modules\mob\living\carbon\carbon_defense.dm`:
	`/mob/living/carbon/attacked_by`

- `code\modules\mob\living\carbon\carbon_defense.dm`:
	`/datum/description_profile/ui_data`
	`/mob/living/carbon/damage_clothes`

- `code\modules\mob\living\carbon\examine.dm`:
	`/mob/living/carbon/examine`

- `code\_onclick\hud\human.dm`:
	`/datum/hud/human/New`

- `code\_onclick\hud\human.dm`:
	`/datum/hud/human/extra_inventory_update`

- `code\modules\mob\living\carbon\human\human_block.dm`:
	`/mob/living/carbon/human/get_blocking_items()`

- `code\modules\mob\living\carbon\human\inventory.dm`:
	`/mob/living/carbon/human/get_item_by_slot`
	`/mob/living/carbon/human/proc/get_head_slots`
	`/mob/living/carbon/human/equip_to_slot`
	`/mob/living/carbon/human/doUnEquip`

- `code\datums\outfit.dm`:
	`/datum/outfit/proc/equip`
	`/datum/outfit/proc/apply_fingerprints`
	`/datum/outfit/proc/get_chameleon_disguise_info(`
	`/datum/outfit/proc/copy_from`
	`/datum/outfit/proc/load_from`

- `code\modules\admin\outfit_editor.dm`:
	`/datum/outfit_editor/proc/choose_item`

- `code\modules\unit_tests\outfit_sanity.dm`:
	`/datum/unit_test/outfit_sanity/Run`


- `code\modules\mob\living\carbon\human\species.dm`:
	`/datum/species/proc/can_equip`
	`/datum/species/proc/handle_fire`

- `code\__HELPERS\type2type.dm`:
	`/proc/slot2body_zone`
	`/proc/slot_to_string`

- `code\modules\clothing\outfits\vv_outfit.dm`:
	`/datum/outfit/varedit/proc/set_equipement_by_slot`
	`/mob/living/carbon/human/proc/copy_outfit`

- `code\modules\mob\living\carbon\human\human_defense.dm`
	`/mob/living/carbon/human/proc/checkarmor`
	`/mob/living/carbon/human/acid_act`
	`/mob/living/carbon/human/damage_clothes`

- `code\modules\mob\living\carbon\monkey\life.dm`:
	`/mob/living/carbon/monkey/handle_fire`

- `code\modules\mob\living\carbon\human\human_stripping.dm`:
	`GLOBAL_LIST_INIT(strippable_human_items`

- `code\modules\mob\living\carbon\human\human_update_icons.dm`:
	`/mob/living/carbon/human/regenerate_icons`

- `code\modules\asset_cache\assets\inventory.dm`:
`	/datum/asset/simple/inventory`

- `code\modules\mob\inventory.dm`:
	`/mob/proc/equip_to_appropriate_slot`

- `code\modules\mob\living\carbon\inventory.dm`:
	`/mob/living/carbon/get_item_by_slot`
	`/mob/living/carbon/equip_to_slot`
	`/mob/living/carbon/doUnEquip`

- `code\modules\mob\living\carbon\monkey\inventory.dm`
	`/mob/living/carbon/monkey/can_equip`

- `code\_onclick\hud\monkey.dm`:
	`/datum/hud/monkey/New`
	`/datum/hud/monkey/persistent_inventory_update`

- `code\modules\mob\living\carbon\monkey\monkey_update_icons.dm`
	`/mob/living/carbon/monkey/regenerate_icons`

<!-- If you edited any core procs, you should list them here. You should specify the files and procs you changed.
E.g: 
- `code/modules/mob/living.dm`: `proc/overriden_proc`, `var/overriden_var`
-->

### Modular Overrides:

- `modular_splurt\code\modules\antagonists\wendigo\mob\mob_equip.dm`
	`/mob/living/carbon/wendigo/can_equip`

- `modular_splurt\code\modules\antagonists\wendigo\mob\wendigo_update_icons.dm (03e0551)`
	`/mob/living/carbon/wendigo/regenerate_icons`

<!-- If you added a new modular override (file or code-wise) for your module, you should list it here. Code files should specify what procs they changed, in case of multiple modules using the same file.
E.g: 
- `modular_nova/master_files/sound/my_cool_sound.ogg`
- `modular_nova/master_files/code/my_modular_override.dm`: `proc/overriden_proc`, `var/overriden_var`
-->

### Defines:

<!-- If you needed to add any defines, mention the files you added those defines in, along with the name of the defines. -->

### Included files that are not contained in this module:
`code\__BLUEMOONCODE\_DEFINES\hud.dm`
	`ui_shoulders`
	`ui_monkey_shoulders`

`code\__DEFINES\inventory.dm`
	Из-за особенностей побитового сдвига (bitshift) редакция кода произведена in-place
	`ITEM_SLOT_SHOULDERS`
	`HIDESHOULDERS`
	`SHOULDERS`

`code\__DEFINES\misc.dm`
	Из-за особенностей побитового сдвига (bitshift) редакция кода произведена in-place
	`SHOULDERS_LAYER`

<!-- Likewise, be it a non-modular file or a modular one that's not contained within the folder belonging to this specific module, it should be mentioned here. Good examples are icons or sounds that are used between multiple modules, or other such edge-cases. -->

### Credits:

<!-- Here go the credits to you, dear coder, and in case of collaborative work or ports, credits to the original source of the code. -->
