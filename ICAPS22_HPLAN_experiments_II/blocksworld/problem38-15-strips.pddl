( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b486 - block
    b608 - block
    b210 - block
    b108 - block
    b830 - block
    b373 - block
    b992 - block
    b418 - block
    b680 - block
    b531 - block
    b54 - block
    b315 - block
    b995 - block
    b908 - block
    b630 - block
    b985 - block
    b853 - block
    b831 - block
    b171 - block
    b160 - block
    b854 - block
    b9 - block
    b883 - block
    b482 - block
    b809 - block
    b233 - block
    b963 - block
    b462 - block
    b109 - block
    b114 - block
    b504 - block
    b494 - block
    b710 - block
    b269 - block
    b547 - block
    b312 - block
    b686 - block
    b480 - block
    b133 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b486 )
    ( on b608 b486 )
    ( on b210 b608 )
    ( on b108 b210 )
    ( on b830 b108 )
    ( on b373 b830 )
    ( on b992 b373 )
    ( on b418 b992 )
    ( on b680 b418 )
    ( on b531 b680 )
    ( on b54 b531 )
    ( on b315 b54 )
    ( on b995 b315 )
    ( on b908 b995 )
    ( on b630 b908 )
    ( on b985 b630 )
    ( on b853 b985 )
    ( on b831 b853 )
    ( on b171 b831 )
    ( on b160 b171 )
    ( on b854 b160 )
    ( on b9 b854 )
    ( on b883 b9 )
    ( on b482 b883 )
    ( on b809 b482 )
    ( on b233 b809 )
    ( on b963 b233 )
    ( on b462 b963 )
    ( on b109 b462 )
    ( on b114 b109 )
    ( on b504 b114 )
    ( on b494 b504 )
    ( on b710 b494 )
    ( on b269 b710 )
    ( on b547 b269 )
    ( on b312 b547 )
    ( on b686 b312 )
    ( on b480 b686 )
    ( on b133 b480 )
    ( clear b133 )
  )
  ( :goal
    ( and
      ( clear b486 )
    )
  )
)
