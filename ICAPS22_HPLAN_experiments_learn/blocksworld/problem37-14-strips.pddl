( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b365 - block
    b23 - block
    b197 - block
    b186 - block
    b979 - block
    b685 - block
    b22 - block
    b87 - block
    b142 - block
    b551 - block
    b435 - block
    b222 - block
    b164 - block
    b715 - block
    b161 - block
    b753 - block
    b423 - block
    b139 - block
    b554 - block
    b207 - block
    b547 - block
    b820 - block
    b611 - block
    b31 - block
    b936 - block
    b559 - block
    b410 - block
    b436 - block
    b235 - block
    b313 - block
    b630 - block
    b281 - block
    b826 - block
    b723 - block
    b453 - block
    b552 - block
    b529 - block
    b830 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b365 )
    ( on b23 b365 )
    ( on b197 b23 )
    ( on b186 b197 )
    ( on b979 b186 )
    ( on b685 b979 )
    ( on b22 b685 )
    ( on b87 b22 )
    ( on b142 b87 )
    ( on b551 b142 )
    ( on b435 b551 )
    ( on b222 b435 )
    ( on b164 b222 )
    ( on b715 b164 )
    ( on b161 b715 )
    ( on b753 b161 )
    ( on b423 b753 )
    ( on b139 b423 )
    ( on b554 b139 )
    ( on b207 b554 )
    ( on b547 b207 )
    ( on b820 b547 )
    ( on b611 b820 )
    ( on b31 b611 )
    ( on b936 b31 )
    ( on b559 b936 )
    ( on b410 b559 )
    ( on b436 b410 )
    ( on b235 b436 )
    ( on b313 b235 )
    ( on b630 b313 )
    ( on b281 b630 )
    ( on b826 b281 )
    ( on b723 b826 )
    ( on b453 b723 )
    ( on b552 b453 )
    ( on b529 b552 )
    ( on b830 b529 )
    ( clear b830 )
  )
  ( :goal
    ( and
      ( clear b365 )
    )
  )
)
