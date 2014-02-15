import XMonad hiding ( (|||) )
import XMonad.Config.Gnome
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.CycleWS
import XMonad.Hooks.SetWMName
import XMonad.Layout.Tabbed
import XMonad.Hooks.ManageDocks
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowNavigation
import qualified XMonad.StackSet as W
import XMonad.Layout.NoBorders
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.TwoPane

myLayoutHook = avoidStruts (windowNavigation $ subTabbed $ twoPane) |||
               (windowNavigation $ subTabbed $ twoPane) ||| noBorders Full
                 where twoPane = TwoPane (3/100) (1/2)

main = xmonad $
  gnomeConfig {
    modMask = mod4Mask
    , terminal = "urxvt"
    , startupHook = setWMName "LG3D" -- fix for swing applications
    , borderWidth = 2
    , normalBorderColor = "#333333"
    , focusedBorderColor = "#4c7899"
    , layoutHook = myLayoutHook
  } `additionalKeys`
  [ ((mod4Mask, xK_z), toggleWS)
  , ((mod4Mask .|. controlMask, xK_h), sendMessage $ pullGroup L)
  , ((mod4Mask .|. controlMask, xK_l), sendMessage $ pullGroup R)
  , ((mod4Mask .|. controlMask, xK_k), sendMessage $ pullGroup U)
  , ((mod4Mask .|. controlMask, xK_j), sendMessage $ pullGroup D)

  , ((mod4Mask .|. controlMask, xK_m), withFocused (sendMessage . MergeAll))
  , ((mod4Mask .|. controlMask, xK_u), withFocused (sendMessage . UnMerge))

  , ((mod4Mask .|. controlMask, xK_period), onGroup W.focusUp')
  , ((mod4Mask .|. controlMask, xK_comma), onGroup W.focusDown')

  , ((mod4Mask .|. controlMask, xK_f), sendMessage $ JumpToLayout "Full")
  ]
