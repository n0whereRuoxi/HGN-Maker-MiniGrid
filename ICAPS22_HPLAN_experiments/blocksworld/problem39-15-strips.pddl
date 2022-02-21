( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b153 - block
    b936 - block
    b872 - block
    b894 - block
    b87 - block
    b957 - block
    b708 - block
    b776 - block
    b839 - block
    b384 - block
    b995 - block
    b355 - block
    b953 - block
    b679 - block
    b481 - block
    b479 - block
    b495 - block
    b738 - block
    b881 - block
    b622 - block
    b808 - block
    b248 - block
    b809 - block
    b610 - block
    b333 - block
    b357 - block
    b190 - block
    b412 - block
    b65 - block
    b783 - block
    b767 - block
    b148 - block
    b902 - block
    b408 - block
    b383 - block
    b928 - block
    b319 - block
    b636 - block
    b420 - block
    b621 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b153 )
    ( on b936 b153 )
    ( on b872 b936 )
    ( on b894 b872 )
    ( on b87 b894 )
    ( on b957 b87 )
    ( on b708 b957 )
    ( on b776 b708 )
    ( on b839 b776 )
    ( on b384 b839 )
    ( on b995 b384 )
    ( on b355 b995 )
    ( on b953 b355 )
    ( on b679 b953 )
    ( on b481 b679 )
    ( on b479 b481 )
    ( on b495 b479 )
    ( on b738 b495 )
    ( on b881 b738 )
    ( on b622 b881 )
    ( on b808 b622 )
    ( on b248 b808 )
    ( on b809 b248 )
    ( on b610 b809 )
    ( on b333 b610 )
    ( on b357 b333 )
    ( on b190 b357 )
    ( on b412 b190 )
    ( on b65 b412 )
    ( on b783 b65 )
    ( on b767 b783 )
    ( on b148 b767 )
    ( on b902 b148 )
    ( on b408 b902 )
    ( on b383 b408 )
    ( on b928 b383 )
    ( on b319 b928 )
    ( on b636 b319 )
    ( on b420 b636 )
    ( on b621 b420 )
    ( clear b621 )
  )
  ( :goal
    ( and
      ( clear b153 )
    )
  )
)
