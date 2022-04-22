( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b219 - block
    b424 - block
    b529 - block
    b647 - block
    b907 - block
    b761 - block
    b713 - block
    b574 - block
    b855 - block
    b4 - block
    b378 - block
    b767 - block
    b229 - block
    b925 - block
    b587 - block
    b748 - block
    b790 - block
    b154 - block
    b400 - block
    b896 - block
    b956 - block
    b329 - block
    b299 - block
    b732 - block
    b766 - block
    b434 - block
    b446 - block
    b569 - block
    b483 - block
    b509 - block
    b206 - block
    b75 - block
    b94 - block
    b242 - block
    b768 - block
    b984 - block
    b715 - block
    b754 - block
    b617 - block
    b648 - block
    b814 - block
    b291 - block
    b395 - block
    b901 - block
    b620 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b219 )
    ( on b424 b219 )
    ( on b529 b424 )
    ( on b647 b529 )
    ( on b907 b647 )
    ( on b761 b907 )
    ( on b713 b761 )
    ( on b574 b713 )
    ( on b855 b574 )
    ( on b4 b855 )
    ( on b378 b4 )
    ( on b767 b378 )
    ( on b229 b767 )
    ( on b925 b229 )
    ( on b587 b925 )
    ( on b748 b587 )
    ( on b790 b748 )
    ( on b154 b790 )
    ( on b400 b154 )
    ( on b896 b400 )
    ( on b956 b896 )
    ( on b329 b956 )
    ( on b299 b329 )
    ( on b732 b299 )
    ( on b766 b732 )
    ( on b434 b766 )
    ( on b446 b434 )
    ( on b569 b446 )
    ( on b483 b569 )
    ( on b509 b483 )
    ( on b206 b509 )
    ( on b75 b206 )
    ( on b94 b75 )
    ( on b242 b94 )
    ( on b768 b242 )
    ( on b984 b768 )
    ( on b715 b984 )
    ( on b754 b715 )
    ( on b617 b754 )
    ( on b648 b617 )
    ( on b814 b648 )
    ( on b291 b814 )
    ( on b395 b291 )
    ( on b901 b395 )
    ( on b620 b901 )
    ( clear b620 )
  )
  ( :goal
    ( and
      ( clear b219 )
    )
  )
)
