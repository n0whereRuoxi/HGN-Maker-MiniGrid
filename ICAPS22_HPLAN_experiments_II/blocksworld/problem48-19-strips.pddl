( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b385 - block
    b581 - block
    b568 - block
    b421 - block
    b161 - block
    b133 - block
    b368 - block
    b331 - block
    b196 - block
    b208 - block
    b612 - block
    b614 - block
    b943 - block
    b629 - block
    b816 - block
    b778 - block
    b58 - block
    b749 - block
    b401 - block
    b462 - block
    b804 - block
    b78 - block
    b704 - block
    b426 - block
    b668 - block
    b4 - block
    b506 - block
    b772 - block
    b848 - block
    b478 - block
    b123 - block
    b896 - block
    b789 - block
    b197 - block
    b661 - block
    b199 - block
    b997 - block
    b606 - block
    b784 - block
    b154 - block
    b438 - block
    b255 - block
    b552 - block
    b125 - block
    b54 - block
    b359 - block
    b55 - block
    b840 - block
    b543 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b385 )
    ( on b581 b385 )
    ( on b568 b581 )
    ( on b421 b568 )
    ( on b161 b421 )
    ( on b133 b161 )
    ( on b368 b133 )
    ( on b331 b368 )
    ( on b196 b331 )
    ( on b208 b196 )
    ( on b612 b208 )
    ( on b614 b612 )
    ( on b943 b614 )
    ( on b629 b943 )
    ( on b816 b629 )
    ( on b778 b816 )
    ( on b58 b778 )
    ( on b749 b58 )
    ( on b401 b749 )
    ( on b462 b401 )
    ( on b804 b462 )
    ( on b78 b804 )
    ( on b704 b78 )
    ( on b426 b704 )
    ( on b668 b426 )
    ( on b4 b668 )
    ( on b506 b4 )
    ( on b772 b506 )
    ( on b848 b772 )
    ( on b478 b848 )
    ( on b123 b478 )
    ( on b896 b123 )
    ( on b789 b896 )
    ( on b197 b789 )
    ( on b661 b197 )
    ( on b199 b661 )
    ( on b997 b199 )
    ( on b606 b997 )
    ( on b784 b606 )
    ( on b154 b784 )
    ( on b438 b154 )
    ( on b255 b438 )
    ( on b552 b255 )
    ( on b125 b552 )
    ( on b54 b125 )
    ( on b359 b54 )
    ( on b55 b359 )
    ( on b840 b55 )
    ( on b543 b840 )
    ( clear b543 )
  )
  ( :goal
    ( and
      ( clear b385 )
    )
  )
)
