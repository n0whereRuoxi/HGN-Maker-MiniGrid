( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b884 - block
    b552 - block
    b135 - block
    b769 - block
    b319 - block
    b520 - block
    b600 - block
    b478 - block
    b373 - block
    b206 - block
    b708 - block
    b292 - block
    b263 - block
    b445 - block
    b579 - block
    b266 - block
    b741 - block
    b926 - block
    b311 - block
    b208 - block
    b912 - block
    b530 - block
    b121 - block
    b519 - block
    b24 - block
    b507 - block
    b848 - block
    b732 - block
    b5 - block
    b646 - block
    b647 - block
    b501 - block
    b441 - block
    b54 - block
    b156 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b884 )
    ( on b552 b884 )
    ( on b135 b552 )
    ( on b769 b135 )
    ( on b319 b769 )
    ( on b520 b319 )
    ( on b600 b520 )
    ( on b478 b600 )
    ( on b373 b478 )
    ( on b206 b373 )
    ( on b708 b206 )
    ( on b292 b708 )
    ( on b263 b292 )
    ( on b445 b263 )
    ( on b579 b445 )
    ( on b266 b579 )
    ( on b741 b266 )
    ( on b926 b741 )
    ( on b311 b926 )
    ( on b208 b311 )
    ( on b912 b208 )
    ( on b530 b912 )
    ( on b121 b530 )
    ( on b519 b121 )
    ( on b24 b519 )
    ( on b507 b24 )
    ( on b848 b507 )
    ( on b732 b848 )
    ( on b5 b732 )
    ( on b646 b5 )
    ( on b647 b646 )
    ( on b501 b647 )
    ( on b441 b501 )
    ( on b54 b441 )
    ( on b156 b54 )
    ( clear b156 )
  )
  ( :goal
    ( and
      ( clear b884 )
    )
  )
)
