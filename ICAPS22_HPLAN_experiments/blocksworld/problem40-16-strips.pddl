( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b387 - block
    b667 - block
    b375 - block
    b298 - block
    b438 - block
    b870 - block
    b17 - block
    b888 - block
    b603 - block
    b987 - block
    b957 - block
    b16 - block
    b670 - block
    b839 - block
    b834 - block
    b899 - block
    b281 - block
    b803 - block
    b829 - block
    b851 - block
    b222 - block
    b283 - block
    b891 - block
    b628 - block
    b210 - block
    b818 - block
    b660 - block
    b164 - block
    b336 - block
    b225 - block
    b411 - block
    b139 - block
    b649 - block
    b146 - block
    b444 - block
    b204 - block
    b757 - block
    b412 - block
    b51 - block
    b600 - block
    b414 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b387 )
    ( on b667 b387 )
    ( on b375 b667 )
    ( on b298 b375 )
    ( on b438 b298 )
    ( on b870 b438 )
    ( on b17 b870 )
    ( on b888 b17 )
    ( on b603 b888 )
    ( on b987 b603 )
    ( on b957 b987 )
    ( on b16 b957 )
    ( on b670 b16 )
    ( on b839 b670 )
    ( on b834 b839 )
    ( on b899 b834 )
    ( on b281 b899 )
    ( on b803 b281 )
    ( on b829 b803 )
    ( on b851 b829 )
    ( on b222 b851 )
    ( on b283 b222 )
    ( on b891 b283 )
    ( on b628 b891 )
    ( on b210 b628 )
    ( on b818 b210 )
    ( on b660 b818 )
    ( on b164 b660 )
    ( on b336 b164 )
    ( on b225 b336 )
    ( on b411 b225 )
    ( on b139 b411 )
    ( on b649 b139 )
    ( on b146 b649 )
    ( on b444 b146 )
    ( on b204 b444 )
    ( on b757 b204 )
    ( on b412 b757 )
    ( on b51 b412 )
    ( on b600 b51 )
    ( on b414 b600 )
    ( clear b414 )
  )
  ( :goal
    ( and
      ( clear b387 )
    )
  )
)
