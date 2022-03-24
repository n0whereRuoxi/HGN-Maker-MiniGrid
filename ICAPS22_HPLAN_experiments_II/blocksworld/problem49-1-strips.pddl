( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b332 - block
    b801 - block
    b554 - block
    b802 - block
    b258 - block
    b763 - block
    b70 - block
    b104 - block
    b278 - block
    b686 - block
    b578 - block
    b708 - block
    b477 - block
    b822 - block
    b676 - block
    b695 - block
    b735 - block
    b281 - block
    b182 - block
    b832 - block
    b391 - block
    b706 - block
    b615 - block
    b129 - block
    b184 - block
    b550 - block
    b501 - block
    b912 - block
    b668 - block
    b944 - block
    b57 - block
    b305 - block
    b112 - block
    b421 - block
    b828 - block
    b472 - block
    b580 - block
    b454 - block
    b685 - block
    b337 - block
    b127 - block
    b534 - block
    b180 - block
    b731 - block
    b603 - block
    b314 - block
    b47 - block
    b255 - block
    b816 - block
    b457 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b332 )
    ( on b801 b332 )
    ( on b554 b801 )
    ( on b802 b554 )
    ( on b258 b802 )
    ( on b763 b258 )
    ( on b70 b763 )
    ( on b104 b70 )
    ( on b278 b104 )
    ( on b686 b278 )
    ( on b578 b686 )
    ( on b708 b578 )
    ( on b477 b708 )
    ( on b822 b477 )
    ( on b676 b822 )
    ( on b695 b676 )
    ( on b735 b695 )
    ( on b281 b735 )
    ( on b182 b281 )
    ( on b832 b182 )
    ( on b391 b832 )
    ( on b706 b391 )
    ( on b615 b706 )
    ( on b129 b615 )
    ( on b184 b129 )
    ( on b550 b184 )
    ( on b501 b550 )
    ( on b912 b501 )
    ( on b668 b912 )
    ( on b944 b668 )
    ( on b57 b944 )
    ( on b305 b57 )
    ( on b112 b305 )
    ( on b421 b112 )
    ( on b828 b421 )
    ( on b472 b828 )
    ( on b580 b472 )
    ( on b454 b580 )
    ( on b685 b454 )
    ( on b337 b685 )
    ( on b127 b337 )
    ( on b534 b127 )
    ( on b180 b534 )
    ( on b731 b180 )
    ( on b603 b731 )
    ( on b314 b603 )
    ( on b47 b314 )
    ( on b255 b47 )
    ( on b816 b255 )
    ( on b457 b816 )
    ( clear b457 )
  )
  ( :goal
    ( and
      ( clear b332 )
    )
  )
)
