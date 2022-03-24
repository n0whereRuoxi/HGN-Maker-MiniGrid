( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b435 - block
    b674 - block
    b743 - block
    b747 - block
    b677 - block
    b166 - block
    b123 - block
    b705 - block
    b905 - block
    b721 - block
    b526 - block
    b855 - block
    b222 - block
    b454 - block
    b955 - block
    b749 - block
    b685 - block
    b876 - block
    b193 - block
    b347 - block
    b490 - block
    b860 - block
    b74 - block
    b532 - block
    b142 - block
    b720 - block
    b68 - block
    b620 - block
    b24 - block
    b732 - block
    b214 - block
    b145 - block
    b510 - block
    b481 - block
    b693 - block
    b409 - block
    b440 - block
    b288 - block
    b651 - block
    b604 - block
    b248 - block
    b433 - block
    b110 - block
    b642 - block
    b290 - block
    b557 - block
    b957 - block
    b804 - block
    b618 - block
    b137 - block
    b269 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b435 )
    ( on b674 b435 )
    ( on b743 b674 )
    ( on b747 b743 )
    ( on b677 b747 )
    ( on b166 b677 )
    ( on b123 b166 )
    ( on b705 b123 )
    ( on b905 b705 )
    ( on b721 b905 )
    ( on b526 b721 )
    ( on b855 b526 )
    ( on b222 b855 )
    ( on b454 b222 )
    ( on b955 b454 )
    ( on b749 b955 )
    ( on b685 b749 )
    ( on b876 b685 )
    ( on b193 b876 )
    ( on b347 b193 )
    ( on b490 b347 )
    ( on b860 b490 )
    ( on b74 b860 )
    ( on b532 b74 )
    ( on b142 b532 )
    ( on b720 b142 )
    ( on b68 b720 )
    ( on b620 b68 )
    ( on b24 b620 )
    ( on b732 b24 )
    ( on b214 b732 )
    ( on b145 b214 )
    ( on b510 b145 )
    ( on b481 b510 )
    ( on b693 b481 )
    ( on b409 b693 )
    ( on b440 b409 )
    ( on b288 b440 )
    ( on b651 b288 )
    ( on b604 b651 )
    ( on b248 b604 )
    ( on b433 b248 )
    ( on b110 b433 )
    ( on b642 b110 )
    ( on b290 b642 )
    ( on b557 b290 )
    ( on b957 b557 )
    ( on b804 b957 )
    ( on b618 b804 )
    ( on b137 b618 )
    ( on b269 b137 )
    ( clear b269 )
  )
  ( :goal
    ( and
      ( clear b435 )
    )
  )
)
