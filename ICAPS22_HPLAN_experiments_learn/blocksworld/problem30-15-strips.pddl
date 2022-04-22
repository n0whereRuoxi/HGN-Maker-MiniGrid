( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b640 - block
    b428 - block
    b127 - block
    b742 - block
    b536 - block
    b703 - block
    b141 - block
    b984 - block
    b838 - block
    b483 - block
    b76 - block
    b308 - block
    b563 - block
    b378 - block
    b233 - block
    b648 - block
    b689 - block
    b566 - block
    b784 - block
    b538 - block
    b576 - block
    b305 - block
    b144 - block
    b185 - block
    b70 - block
    b288 - block
    b899 - block
    b992 - block
    b811 - block
    b264 - block
    b725 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b640 )
    ( on b428 b640 )
    ( on b127 b428 )
    ( on b742 b127 )
    ( on b536 b742 )
    ( on b703 b536 )
    ( on b141 b703 )
    ( on b984 b141 )
    ( on b838 b984 )
    ( on b483 b838 )
    ( on b76 b483 )
    ( on b308 b76 )
    ( on b563 b308 )
    ( on b378 b563 )
    ( on b233 b378 )
    ( on b648 b233 )
    ( on b689 b648 )
    ( on b566 b689 )
    ( on b784 b566 )
    ( on b538 b784 )
    ( on b576 b538 )
    ( on b305 b576 )
    ( on b144 b305 )
    ( on b185 b144 )
    ( on b70 b185 )
    ( on b288 b70 )
    ( on b899 b288 )
    ( on b992 b899 )
    ( on b811 b992 )
    ( on b264 b811 )
    ( on b725 b264 )
    ( clear b725 )
  )
  ( :goal
    ( and
      ( clear b640 )
    )
  )
)
