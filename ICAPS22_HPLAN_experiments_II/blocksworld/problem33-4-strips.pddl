( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b694 - block
    b681 - block
    b901 - block
    b215 - block
    b137 - block
    b210 - block
    b228 - block
    b534 - block
    b692 - block
    b288 - block
    b318 - block
    b937 - block
    b419 - block
    b880 - block
    b858 - block
    b135 - block
    b715 - block
    b693 - block
    b428 - block
    b386 - block
    b945 - block
    b981 - block
    b411 - block
    b214 - block
    b240 - block
    b260 - block
    b90 - block
    b673 - block
    b480 - block
    b102 - block
    b517 - block
    b487 - block
    b284 - block
    b175 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b694 )
    ( on b681 b694 )
    ( on b901 b681 )
    ( on b215 b901 )
    ( on b137 b215 )
    ( on b210 b137 )
    ( on b228 b210 )
    ( on b534 b228 )
    ( on b692 b534 )
    ( on b288 b692 )
    ( on b318 b288 )
    ( on b937 b318 )
    ( on b419 b937 )
    ( on b880 b419 )
    ( on b858 b880 )
    ( on b135 b858 )
    ( on b715 b135 )
    ( on b693 b715 )
    ( on b428 b693 )
    ( on b386 b428 )
    ( on b945 b386 )
    ( on b981 b945 )
    ( on b411 b981 )
    ( on b214 b411 )
    ( on b240 b214 )
    ( on b260 b240 )
    ( on b90 b260 )
    ( on b673 b90 )
    ( on b480 b673 )
    ( on b102 b480 )
    ( on b517 b102 )
    ( on b487 b517 )
    ( on b284 b487 )
    ( on b175 b284 )
    ( clear b175 )
  )
  ( :goal
    ( and
      ( clear b694 )
    )
  )
)
