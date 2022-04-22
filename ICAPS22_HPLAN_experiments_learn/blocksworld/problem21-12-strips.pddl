( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b915 - block
    b215 - block
    b169 - block
    b149 - block
    b81 - block
    b3 - block
    b803 - block
    b167 - block
    b116 - block
    b960 - block
    b781 - block
    b585 - block
    b557 - block
    b386 - block
    b484 - block
    b226 - block
    b426 - block
    b203 - block
    b853 - block
    b213 - block
    b520 - block
    b281 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b915 )
    ( on b215 b915 )
    ( on b169 b215 )
    ( on b149 b169 )
    ( on b81 b149 )
    ( on b3 b81 )
    ( on b803 b3 )
    ( on b167 b803 )
    ( on b116 b167 )
    ( on b960 b116 )
    ( on b781 b960 )
    ( on b585 b781 )
    ( on b557 b585 )
    ( on b386 b557 )
    ( on b484 b386 )
    ( on b226 b484 )
    ( on b426 b226 )
    ( on b203 b426 )
    ( on b853 b203 )
    ( on b213 b853 )
    ( on b520 b213 )
    ( on b281 b520 )
    ( clear b281 )
  )
  ( :goal
    ( and
      ( clear b915 )
    )
  )
)
