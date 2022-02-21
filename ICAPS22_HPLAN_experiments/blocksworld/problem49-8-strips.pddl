( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b959 - block
    b702 - block
    b218 - block
    b816 - block
    b828 - block
    b527 - block
    b983 - block
    b284 - block
    b54 - block
    b543 - block
    b577 - block
    b386 - block
    b498 - block
    b524 - block
    b62 - block
    b609 - block
    b23 - block
    b950 - block
    b839 - block
    b256 - block
    b999 - block
    b541 - block
    b562 - block
    b24 - block
    b130 - block
    b287 - block
    b327 - block
    b705 - block
    b391 - block
    b658 - block
    b274 - block
    b512 - block
    b881 - block
    b719 - block
    b514 - block
    b397 - block
    b998 - block
    b897 - block
    b407 - block
    b805 - block
    b513 - block
    b409 - block
    b539 - block
    b789 - block
    b382 - block
    b994 - block
    b11 - block
    b717 - block
    b548 - block
    b90 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b959 )
    ( on b702 b959 )
    ( on b218 b702 )
    ( on b816 b218 )
    ( on b828 b816 )
    ( on b527 b828 )
    ( on b983 b527 )
    ( on b284 b983 )
    ( on b54 b284 )
    ( on b543 b54 )
    ( on b577 b543 )
    ( on b386 b577 )
    ( on b498 b386 )
    ( on b524 b498 )
    ( on b62 b524 )
    ( on b609 b62 )
    ( on b23 b609 )
    ( on b950 b23 )
    ( on b839 b950 )
    ( on b256 b839 )
    ( on b999 b256 )
    ( on b541 b999 )
    ( on b562 b541 )
    ( on b24 b562 )
    ( on b130 b24 )
    ( on b287 b130 )
    ( on b327 b287 )
    ( on b705 b327 )
    ( on b391 b705 )
    ( on b658 b391 )
    ( on b274 b658 )
    ( on b512 b274 )
    ( on b881 b512 )
    ( on b719 b881 )
    ( on b514 b719 )
    ( on b397 b514 )
    ( on b998 b397 )
    ( on b897 b998 )
    ( on b407 b897 )
    ( on b805 b407 )
    ( on b513 b805 )
    ( on b409 b513 )
    ( on b539 b409 )
    ( on b789 b539 )
    ( on b382 b789 )
    ( on b994 b382 )
    ( on b11 b994 )
    ( on b717 b11 )
    ( on b548 b717 )
    ( on b90 b548 )
    ( clear b90 )
  )
  ( :goal
    ( and
      ( clear b959 )
    )
  )
)
