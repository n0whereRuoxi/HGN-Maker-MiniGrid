( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b178 - block
    b711 - block
    b130 - block
    b639 - block
    b199 - block
    b864 - block
    b316 - block
    b273 - block
    b854 - block
    b782 - block
    b897 - block
    b98 - block
    b875 - block
    b844 - block
    b304 - block
    b319 - block
    b491 - block
    b963 - block
    b724 - block
    b687 - block
    b539 - block
    b725 - block
    b284 - block
    b994 - block
    b825 - block
    b503 - block
    b437 - block
    b281 - block
    b6 - block
    b106 - block
    b149 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b178 )
    ( on b711 b178 )
    ( on b130 b711 )
    ( on b639 b130 )
    ( on b199 b639 )
    ( on b864 b199 )
    ( on b316 b864 )
    ( on b273 b316 )
    ( on b854 b273 )
    ( on b782 b854 )
    ( on b897 b782 )
    ( on b98 b897 )
    ( on b875 b98 )
    ( on b844 b875 )
    ( on b304 b844 )
    ( on b319 b304 )
    ( on b491 b319 )
    ( on b963 b491 )
    ( on b724 b963 )
    ( on b687 b724 )
    ( on b539 b687 )
    ( on b725 b539 )
    ( on b284 b725 )
    ( on b994 b284 )
    ( on b825 b994 )
    ( on b503 b825 )
    ( on b437 b503 )
    ( on b281 b437 )
    ( on b6 b281 )
    ( on b106 b6 )
    ( on b149 b106 )
    ( clear b149 )
  )
  ( :goal
    ( and
      ( clear b178 )
    )
  )
)
