( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b723 - block
    b472 - block
    b68 - block
    b463 - block
    b694 - block
    b233 - block
    b444 - block
    b91 - block
    b57 - block
    b407 - block
    b151 - block
    b843 - block
    b930 - block
    b342 - block
    b652 - block
    b227 - block
    b477 - block
    b982 - block
    b156 - block
    b225 - block
    b234 - block
    b366 - block
    b11 - block
    b469 - block
    b402 - block
    b866 - block
    b88 - block
    b572 - block
    b460 - block
    b493 - block
    b31 - block
    b842 - block
    b197 - block
    b275 - block
    b999 - block
    b716 - block
    b120 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b723 )
    ( on b472 b723 )
    ( on b68 b472 )
    ( on b463 b68 )
    ( on b694 b463 )
    ( on b233 b694 )
    ( on b444 b233 )
    ( on b91 b444 )
    ( on b57 b91 )
    ( on b407 b57 )
    ( on b151 b407 )
    ( on b843 b151 )
    ( on b930 b843 )
    ( on b342 b930 )
    ( on b652 b342 )
    ( on b227 b652 )
    ( on b477 b227 )
    ( on b982 b477 )
    ( on b156 b982 )
    ( on b225 b156 )
    ( on b234 b225 )
    ( on b366 b234 )
    ( on b11 b366 )
    ( on b469 b11 )
    ( on b402 b469 )
    ( on b866 b402 )
    ( on b88 b866 )
    ( on b572 b88 )
    ( on b460 b572 )
    ( on b493 b460 )
    ( on b31 b493 )
    ( on b842 b31 )
    ( on b197 b842 )
    ( on b275 b197 )
    ( on b999 b275 )
    ( on b716 b999 )
    ( on b120 b716 )
    ( clear b120 )
  )
  ( :goal
    ( and
      ( clear b723 )
    )
  )
)
