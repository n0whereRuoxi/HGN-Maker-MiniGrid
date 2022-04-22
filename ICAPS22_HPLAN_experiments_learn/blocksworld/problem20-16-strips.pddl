( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b135 - block
    b989 - block
    b728 - block
    b247 - block
    b283 - block
    b277 - block
    b357 - block
    b78 - block
    b319 - block
    b757 - block
    b648 - block
    b951 - block
    b631 - block
    b315 - block
    b734 - block
    b775 - block
    b434 - block
    b747 - block
    b929 - block
    b306 - block
    b627 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b135 )
    ( on b989 b135 )
    ( on b728 b989 )
    ( on b247 b728 )
    ( on b283 b247 )
    ( on b277 b283 )
    ( on b357 b277 )
    ( on b78 b357 )
    ( on b319 b78 )
    ( on b757 b319 )
    ( on b648 b757 )
    ( on b951 b648 )
    ( on b631 b951 )
    ( on b315 b631 )
    ( on b734 b315 )
    ( on b775 b734 )
    ( on b434 b775 )
    ( on b747 b434 )
    ( on b929 b747 )
    ( on b306 b929 )
    ( on b627 b306 )
    ( clear b627 )
  )
  ( :goal
    ( and
      ( clear b135 )
    )
  )
)
