( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b216 - block
    b837 - block
    b971 - block
    b929 - block
    b871 - block
    b626 - block
    b268 - block
    b537 - block
    b27 - block
    b930 - block
    b669 - block
    b798 - block
    b599 - block
    b218 - block
    b109 - block
    b436 - block
    b819 - block
    b915 - block
    b72 - block
    b190 - block
    b686 - block
    b50 - block
    b182 - block
    b809 - block
    b506 - block
    b229 - block
    b283 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b216 )
    ( on b837 b216 )
    ( on b971 b837 )
    ( on b929 b971 )
    ( on b871 b929 )
    ( on b626 b871 )
    ( on b268 b626 )
    ( on b537 b268 )
    ( on b27 b537 )
    ( on b930 b27 )
    ( on b669 b930 )
    ( on b798 b669 )
    ( on b599 b798 )
    ( on b218 b599 )
    ( on b109 b218 )
    ( on b436 b109 )
    ( on b819 b436 )
    ( on b915 b819 )
    ( on b72 b915 )
    ( on b190 b72 )
    ( on b686 b190 )
    ( on b50 b686 )
    ( on b182 b50 )
    ( on b809 b182 )
    ( on b506 b809 )
    ( on b229 b506 )
    ( on b283 b229 )
    ( clear b283 )
  )
  ( :goal
    ( and
      ( clear b216 )
    )
  )
)
