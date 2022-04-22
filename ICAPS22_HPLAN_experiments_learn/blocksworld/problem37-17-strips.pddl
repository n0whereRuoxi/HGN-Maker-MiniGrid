( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b113 - block
    b530 - block
    b532 - block
    b868 - block
    b207 - block
    b558 - block
    b805 - block
    b111 - block
    b479 - block
    b211 - block
    b989 - block
    b240 - block
    b834 - block
    b827 - block
    b137 - block
    b394 - block
    b624 - block
    b80 - block
    b955 - block
    b65 - block
    b526 - block
    b907 - block
    b435 - block
    b699 - block
    b637 - block
    b432 - block
    b664 - block
    b402 - block
    b191 - block
    b296 - block
    b152 - block
    b920 - block
    b450 - block
    b513 - block
    b799 - block
    b950 - block
    b841 - block
    b547 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b113 )
    ( on b530 b113 )
    ( on b532 b530 )
    ( on b868 b532 )
    ( on b207 b868 )
    ( on b558 b207 )
    ( on b805 b558 )
    ( on b111 b805 )
    ( on b479 b111 )
    ( on b211 b479 )
    ( on b989 b211 )
    ( on b240 b989 )
    ( on b834 b240 )
    ( on b827 b834 )
    ( on b137 b827 )
    ( on b394 b137 )
    ( on b624 b394 )
    ( on b80 b624 )
    ( on b955 b80 )
    ( on b65 b955 )
    ( on b526 b65 )
    ( on b907 b526 )
    ( on b435 b907 )
    ( on b699 b435 )
    ( on b637 b699 )
    ( on b432 b637 )
    ( on b664 b432 )
    ( on b402 b664 )
    ( on b191 b402 )
    ( on b296 b191 )
    ( on b152 b296 )
    ( on b920 b152 )
    ( on b450 b920 )
    ( on b513 b450 )
    ( on b799 b513 )
    ( on b950 b799 )
    ( on b841 b950 )
    ( on b547 b841 )
    ( clear b547 )
  )
  ( :goal
    ( and
      ( clear b113 )
    )
  )
)
