( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b307 - block
    b733 - block
    b2 - block
    b776 - block
    b196 - block
    b875 - block
    b469 - block
    b530 - block
    b652 - block
    b670 - block
    b462 - block
    b392 - block
    b360 - block
    b790 - block
    b700 - block
    b828 - block
    b128 - block
    b699 - block
    b845 - block
    b4 - block
    b961 - block
    b222 - block
    b111 - block
    b804 - block
    b6 - block
    b412 - block
    b14 - block
    b704 - block
    b139 - block
    b896 - block
    b359 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b307 )
    ( on b733 b307 )
    ( on b2 b733 )
    ( on b776 b2 )
    ( on b196 b776 )
    ( on b875 b196 )
    ( on b469 b875 )
    ( on b530 b469 )
    ( on b652 b530 )
    ( on b670 b652 )
    ( on b462 b670 )
    ( on b392 b462 )
    ( on b360 b392 )
    ( on b790 b360 )
    ( on b700 b790 )
    ( on b828 b700 )
    ( on b128 b828 )
    ( on b699 b128 )
    ( on b845 b699 )
    ( on b4 b845 )
    ( on b961 b4 )
    ( on b222 b961 )
    ( on b111 b222 )
    ( on b804 b111 )
    ( on b6 b804 )
    ( on b412 b6 )
    ( on b14 b412 )
    ( on b704 b14 )
    ( on b139 b704 )
    ( on b896 b139 )
    ( on b359 b896 )
    ( clear b359 )
  )
  ( :goal
    ( and
      ( clear b307 )
    )
  )
)
