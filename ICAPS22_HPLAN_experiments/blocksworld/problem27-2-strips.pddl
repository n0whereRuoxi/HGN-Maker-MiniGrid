( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b441 - block
    b254 - block
    b35 - block
    b94 - block
    b308 - block
    b116 - block
    b351 - block
    b792 - block
    b329 - block
    b328 - block
    b341 - block
    b741 - block
    b231 - block
    b922 - block
    b215 - block
    b131 - block
    b714 - block
    b471 - block
    b806 - block
    b770 - block
    b326 - block
    b688 - block
    b30 - block
    b5 - block
    b214 - block
    b324 - block
    b397 - block
    b431 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b441 )
    ( on b254 b441 )
    ( on b35 b254 )
    ( on b94 b35 )
    ( on b308 b94 )
    ( on b116 b308 )
    ( on b351 b116 )
    ( on b792 b351 )
    ( on b329 b792 )
    ( on b328 b329 )
    ( on b341 b328 )
    ( on b741 b341 )
    ( on b231 b741 )
    ( on b922 b231 )
    ( on b215 b922 )
    ( on b131 b215 )
    ( on b714 b131 )
    ( on b471 b714 )
    ( on b806 b471 )
    ( on b770 b806 )
    ( on b326 b770 )
    ( on b688 b326 )
    ( on b30 b688 )
    ( on b5 b30 )
    ( on b214 b5 )
    ( on b324 b214 )
    ( on b397 b324 )
    ( on b431 b397 )
    ( clear b431 )
  )
  ( :goal
    ( and
      ( clear b441 )
    )
  )
)
