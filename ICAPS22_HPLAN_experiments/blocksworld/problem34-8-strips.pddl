( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b715 - block
    b738 - block
    b126 - block
    b813 - block
    b335 - block
    b493 - block
    b732 - block
    b664 - block
    b48 - block
    b974 - block
    b764 - block
    b604 - block
    b570 - block
    b393 - block
    b384 - block
    b966 - block
    b158 - block
    b5 - block
    b485 - block
    b579 - block
    b65 - block
    b214 - block
    b926 - block
    b520 - block
    b29 - block
    b506 - block
    b920 - block
    b205 - block
    b666 - block
    b725 - block
    b805 - block
    b494 - block
    b989 - block
    b404 - block
    b598 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b715 )
    ( on b738 b715 )
    ( on b126 b738 )
    ( on b813 b126 )
    ( on b335 b813 )
    ( on b493 b335 )
    ( on b732 b493 )
    ( on b664 b732 )
    ( on b48 b664 )
    ( on b974 b48 )
    ( on b764 b974 )
    ( on b604 b764 )
    ( on b570 b604 )
    ( on b393 b570 )
    ( on b384 b393 )
    ( on b966 b384 )
    ( on b158 b966 )
    ( on b5 b158 )
    ( on b485 b5 )
    ( on b579 b485 )
    ( on b65 b579 )
    ( on b214 b65 )
    ( on b926 b214 )
    ( on b520 b926 )
    ( on b29 b520 )
    ( on b506 b29 )
    ( on b920 b506 )
    ( on b205 b920 )
    ( on b666 b205 )
    ( on b725 b666 )
    ( on b805 b725 )
    ( on b494 b805 )
    ( on b989 b494 )
    ( on b404 b989 )
    ( on b598 b404 )
    ( clear b598 )
  )
  ( :goal
    ( and
      ( clear b715 )
    )
  )
)
