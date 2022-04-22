( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b52 - block
    b561 - block
    b962 - block
    b749 - block
    b605 - block
    b354 - block
    b473 - block
    b844 - block
    b520 - block
    b581 - block
    b394 - block
    b596 - block
    b881 - block
    b917 - block
    b680 - block
    b725 - block
    b526 - block
    b665 - block
    b232 - block
    b147 - block
    b989 - block
    b886 - block
    b20 - block
    b993 - block
    b428 - block
    b95 - block
    b769 - block
    b58 - block
    b533 - block
    b233 - block
    b190 - block
    b945 - block
    b764 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b52 )
    ( on b561 b52 )
    ( on b962 b561 )
    ( on b749 b962 )
    ( on b605 b749 )
    ( on b354 b605 )
    ( on b473 b354 )
    ( on b844 b473 )
    ( on b520 b844 )
    ( on b581 b520 )
    ( on b394 b581 )
    ( on b596 b394 )
    ( on b881 b596 )
    ( on b917 b881 )
    ( on b680 b917 )
    ( on b725 b680 )
    ( on b526 b725 )
    ( on b665 b526 )
    ( on b232 b665 )
    ( on b147 b232 )
    ( on b989 b147 )
    ( on b886 b989 )
    ( on b20 b886 )
    ( on b993 b20 )
    ( on b428 b993 )
    ( on b95 b428 )
    ( on b769 b95 )
    ( on b58 b769 )
    ( on b533 b58 )
    ( on b233 b533 )
    ( on b190 b233 )
    ( on b945 b190 )
    ( on b764 b945 )
    ( clear b764 )
  )
  ( :goal
    ( and
      ( clear b52 )
    )
  )
)
