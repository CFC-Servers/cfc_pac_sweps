# cfc_pac_sweps
Sweps allowed in PAC during build mode for CFC

PAC SWEPs have ammo, but will play sound or fire bullets.
Instead, they serve as placeholders for players to make weapon-based PAC events, using `weapon_class` event type and so on.
Additionally, these SWEPs will automatically trigger the `command` event with the following names:

- Primary fire: `swep_primary` (pulse)
- Secondary fire: `swep_secondary` (pulse)
- Reload start: `swep_reload` (pulse)
- Reloading: `swep_reloading` (sustained on, then off)
- Reload end: `swep_reloaded` (pulse)

PAC SWEPs will also trigger a second `command` event with the name `baseName_swepClass`, where `baseName` is the name listed above, and `swepClass` is the SWEP's class.
For example, shooting a `pac_smg` will yield two `command` triggers, `swep_primary` and `swep_primay_pac_smg`

Each SWEP will try to remain as similar to the original base-game weapon as possible, in therms of clip size, cooldowns, and presence/absence of secondary firing modes.
