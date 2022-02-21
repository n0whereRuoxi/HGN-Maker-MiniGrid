( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b183 - block
    b313 - block
    b457 - block
    b622 - block
    b951 - block
    b22 - block
    b550 - block
    b92 - block
    b310 - block
    b408 - block
    b700 - block
    b276 - block
    b689 - block
    b997 - block
    b286 - block
    b319 - block
    b247 - block
    b663 - block
    b568 - block
    b288 - block
    b325 - block
    b743 - block
    b228 - block
    b487 - block
    b693 - block
    b661 - block
    b71 - block
    b882 - block
    b374 - block
    b41 - block
    b312 - block
    b840 - block
    b234 - block
    b970 - block
    b635 - block
    b157 - block
    b335 - block
    b918 - block
    b562 - block
    b956 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b183 )
    ( on b313 b183 )
    ( on b457 b313 )
    ( on b622 b457 )
    ( on b951 b622 )
    ( on b22 b951 )
    ( on b550 b22 )
    ( on b92 b550 )
    ( on b310 b92 )
    ( on b408 b310 )
    ( on b700 b408 )
    ( on b276 b700 )
    ( on b689 b276 )
    ( on b997 b689 )
    ( on b286 b997 )
    ( on b319 b286 )
    ( on b247 b319 )
    ( on b663 b247 )
    ( on b568 b663 )
    ( on b288 b568 )
    ( on b325 b288 )
    ( on b743 b325 )
    ( on b228 b743 )
    ( on b487 b228 )
    ( on b693 b487 )
    ( on b661 b693 )
    ( on b71 b661 )
    ( on b882 b71 )
    ( on b374 b882 )
    ( on b41 b374 )
    ( on b312 b41 )
    ( on b840 b312 )
    ( on b234 b840 )
    ( on b970 b234 )
    ( on b635 b970 )
    ( on b157 b635 )
    ( on b335 b157 )
    ( on b918 b335 )
    ( on b562 b918 )
    ( on b956 b562 )
    ( clear b956 )
  )
  ( :goal
    ( and
      ( clear b183 )
    )
  )
)
