( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b725 - block
    b293 - block
    b579 - block
    b715 - block
    b336 - block
    b626 - block
    b539 - block
    b727 - block
    b169 - block
    b800 - block
    b384 - block
    b995 - block
    b631 - block
    b206 - block
    b629 - block
    b367 - block
    b584 - block
    b647 - block
    b81 - block
    b183 - block
    b347 - block
    b879 - block
    b118 - block
    b523 - block
    b140 - block
    b877 - block
    b64 - block
    b522 - block
    b57 - block
    b44 - block
    b89 - block
    b749 - block
    b618 - block
    b603 - block
    b635 - block
    b670 - block
    b383 - block
    b15 - block
    b787 - block
    b577 - block
    b601 - block
    b763 - block
    b126 - block
    b817 - block
    b198 - block
    b637 - block
    b905 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b725 )
    ( on b293 b725 )
    ( on b579 b293 )
    ( on b715 b579 )
    ( on b336 b715 )
    ( on b626 b336 )
    ( on b539 b626 )
    ( on b727 b539 )
    ( on b169 b727 )
    ( on b800 b169 )
    ( on b384 b800 )
    ( on b995 b384 )
    ( on b631 b995 )
    ( on b206 b631 )
    ( on b629 b206 )
    ( on b367 b629 )
    ( on b584 b367 )
    ( on b647 b584 )
    ( on b81 b647 )
    ( on b183 b81 )
    ( on b347 b183 )
    ( on b879 b347 )
    ( on b118 b879 )
    ( on b523 b118 )
    ( on b140 b523 )
    ( on b877 b140 )
    ( on b64 b877 )
    ( on b522 b64 )
    ( on b57 b522 )
    ( on b44 b57 )
    ( on b89 b44 )
    ( on b749 b89 )
    ( on b618 b749 )
    ( on b603 b618 )
    ( on b635 b603 )
    ( on b670 b635 )
    ( on b383 b670 )
    ( on b15 b383 )
    ( on b787 b15 )
    ( on b577 b787 )
    ( on b601 b577 )
    ( on b763 b601 )
    ( on b126 b763 )
    ( on b817 b126 )
    ( on b198 b817 )
    ( on b637 b198 )
    ( on b905 b637 )
    ( clear b905 )
  )
  ( :goal
    ( and
      ( clear b725 )
    )
  )
)
