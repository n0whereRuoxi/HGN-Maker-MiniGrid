( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b705 - block
    b284 - block
    b818 - block
    b987 - block
    b47 - block
    b267 - block
    b482 - block
    b841 - block
    b636 - block
    b923 - block
    b375 - block
    b936 - block
    b543 - block
    b779 - block
    b937 - block
    b369 - block
    b677 - block
    b639 - block
    b443 - block
    b52 - block
    b525 - block
    b879 - block
    b567 - block
    b533 - block
    b824 - block
    b786 - block
    b420 - block
    b131 - block
    b700 - block
    b318 - block
    b647 - block
    b969 - block
    b968 - block
    b286 - block
    b472 - block
    b535 - block
    b566 - block
    b844 - block
    b877 - block
    b64 - block
    b506 - block
    b14 - block
    b254 - block
    b598 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b705 )
    ( on b284 b705 )
    ( on b818 b284 )
    ( on b987 b818 )
    ( on b47 b987 )
    ( on b267 b47 )
    ( on b482 b267 )
    ( on b841 b482 )
    ( on b636 b841 )
    ( on b923 b636 )
    ( on b375 b923 )
    ( on b936 b375 )
    ( on b543 b936 )
    ( on b779 b543 )
    ( on b937 b779 )
    ( on b369 b937 )
    ( on b677 b369 )
    ( on b639 b677 )
    ( on b443 b639 )
    ( on b52 b443 )
    ( on b525 b52 )
    ( on b879 b525 )
    ( on b567 b879 )
    ( on b533 b567 )
    ( on b824 b533 )
    ( on b786 b824 )
    ( on b420 b786 )
    ( on b131 b420 )
    ( on b700 b131 )
    ( on b318 b700 )
    ( on b647 b318 )
    ( on b969 b647 )
    ( on b968 b969 )
    ( on b286 b968 )
    ( on b472 b286 )
    ( on b535 b472 )
    ( on b566 b535 )
    ( on b844 b566 )
    ( on b877 b844 )
    ( on b64 b877 )
    ( on b506 b64 )
    ( on b14 b506 )
    ( on b254 b14 )
    ( on b598 b254 )
    ( clear b598 )
  )
  ( :goal
    ( and
      ( clear b705 )
    )
  )
)
