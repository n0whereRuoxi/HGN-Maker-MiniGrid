( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b246 - block
    b517 - block
    b167 - block
    b771 - block
    b599 - block
    b317 - block
    b926 - block
    b858 - block
    b409 - block
    b389 - block
    b712 - block
    b620 - block
    b237 - block
    b340 - block
    b747 - block
    b255 - block
    b112 - block
    b335 - block
    b943 - block
    b689 - block
    b471 - block
    b187 - block
    b445 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b246 )
    ( on b517 b246 )
    ( on b167 b517 )
    ( on b771 b167 )
    ( on b599 b771 )
    ( on b317 b599 )
    ( on b926 b317 )
    ( on b858 b926 )
    ( on b409 b858 )
    ( on b389 b409 )
    ( on b712 b389 )
    ( on b620 b712 )
    ( on b237 b620 )
    ( on b340 b237 )
    ( on b747 b340 )
    ( on b255 b747 )
    ( on b112 b255 )
    ( on b335 b112 )
    ( on b943 b335 )
    ( on b689 b943 )
    ( on b471 b689 )
    ( on b187 b471 )
    ( on b445 b187 )
    ( clear b445 )
  )
  ( :goal
    ( and
      ( clear b246 )
    )
  )
)
