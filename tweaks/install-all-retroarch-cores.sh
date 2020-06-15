#!/bin/bash
source config.sh

links=(
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/3dengine_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/4do_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/81_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/2048_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/atari800_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/bk_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/blastem_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/bluemsx_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/boom3_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/boom3_xp_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/bsnes2014_accuracy_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/bsnes2014_balanced_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/bsnes2014_performance_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/bsnes_hd_beta_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/bsnes_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/bsnes_mercury_accuracy_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/bsnes_mercury_balanced_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/bsnes_mercury_performance_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/cannonball_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/cap32_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/chailove_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/citra_canary_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/craft_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/crocods_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/daphne_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/desmume2015_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/desmume_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/dhewm3_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/dhewm3_xp_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/dinothawr_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/dolphin_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/dosbox_core_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/dosbox_svn_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/easyrpg_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/ecwolf_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/emux_chip8_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/emux_gb_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/emux_nes_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/emux_sms_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/fbalpha2012_cps1_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/fbalpha2012_cps2_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/fbalpha2012_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/fbalpha2012_neogeo_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/fbneo_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/fceumm_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/fceumm_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/ffmpeg_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/flycast_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/fmsx_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/freechaf_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/freeintv_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/frodo_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/fuse_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/gambatte_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/gearboy_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/gearsystem_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/genesis_plus_gx_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/gme_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/gpsp_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/gw_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/gw_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/handy_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/hatari_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/hbmame_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/higan_sfc_balanced_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/higan_sfc_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/imageviewer_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/ishiiruka_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/kronos_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/lutro_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mame2000_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mame2003_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mame2003_plus_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mame2010_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mame2015_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mame2016_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mame_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mednafen_gba_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mednafen_lynx_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mednafen_ngp_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mednafen_pce_fast_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mednafen_pce_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mednafen_pcfx_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mednafen_psx_hw_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mednafen_saturn_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mednafen_snes_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mednafen_supergrafx_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mednafen_vb_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/melonds_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mesen-s_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mesen_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mess2015_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/meteor_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mgba_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mrboom_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mu_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mupen64plus_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/mupen64plus_next_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/nekop2_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/neocd_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/nestopia_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/np2kai_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/nxengine_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/o2em_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/openlara_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/opera_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/parallel_n64_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/pcsx_rearmed_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/picodrive_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/play_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/pocketcdg_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/pokemini_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/ppsspp_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/prboom_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/prosystem_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/puae_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/px68k_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/quasi88_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/quicknes_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/race_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/redbook_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/reminiscence_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/remotejoy_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/sameboy_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/scummvm_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/smsplus_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/snes9x2002_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/snes9x2005_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/snes9x2005_plus_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/snes9x2010_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/snes9x_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/squirreljme_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/stella2014_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/stonesoup_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/tgbdual_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/theodore_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/thepowdertoy_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/tic80_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/tyrquake_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/ume2015_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/ume2015_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/uzem_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vba_next_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vecx_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vemulator_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vice_x64_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vice_x64sc_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vice_x128_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vice_xcbm2_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vice_xcbm5x0_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vice_xpet_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vice_xplus4_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vice_xscpu64_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vice_xvic_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/virtualjaguar_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vitaquake2_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vitaquake3_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/vitavoyager_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/x1_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/xrick_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/yabasanshiro_libretro.so.zip" 
    "https://buildbot.libretro.com/nightly/linux/x86_64/latest/yabause_libretro.so.zip" 
)

# common to all linux distros
if basedOn "$osname" "$linux"; then
    # code that has to be executed before downstream-specific distros
    # common to arch-based distros
    if basedOn "$osname" "$archlinux"; then
        # code that has to be executed before downstream-specific distros
        # arch linux-specific
        if [[ "$osname" == "$archlinux" ]]; then
            :
        fi
        # code that has to be executed after downstream-specific distros
    # common to debian-based distros
    elif basedOn "$osname" "$debian"; then
        # code that has to be executed before downstream-specific distros
        # debian-specific
        if [[ "$osname" == "$debian" ]]; then
            :
        # common to ubuntu-based distros
        elif basedOn "$osname" "$ubuntu"; then
            # code that has to be executed before downstream-specific distros
            # ubuntu-specific
            if [[ "$osname" == "$ubuntu" ]]; then
                :
            fi
            # code that has to be executed after downstream-specific distros
        fi
        # code that has to be executed after downstream-specific distros
    # common to fedora-based distros
    elif basedOn "$osname" "$fedora"; then
        # code that has to be executed before downstream-specific distros
        # fedora-specific
        if [[ "$osname" == "$fedora" ]]; then
            sudo ln -s "/usr/lib64/libbz2.so.1.0.8" "/usr/lib64/libbz2.so.1.0"
            sudo chmod 644 "/usr/lib64/libbz2.so.1.0"
        fi
        # code that has to be executed after downstream-specific distros
    fi
    # code that has to be executed after downstream-specific distros
    mkdir "/tmp/libretro-cores"
    for i in "${links[@]}"; do
        wget -q "$i" -P "/tmp/libretro-cores"
        sudo unzip -q -n "/tmp/libretro-cores/$(basename $i)" -d "/usr/lib64/libretro"
        sudo chmod 644 "/usr/lib64/libretro/$(basename $i .zip)"
    done
    rm -r "/tmp/libretro-cores"
fi
