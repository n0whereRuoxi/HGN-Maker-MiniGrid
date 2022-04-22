( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b613 - block
    b514 - block
    b673 - block
    b463 - block
    b662 - block
    b612 - block
    b275 - block
    b877 - block
    b357 - block
    b679 - block
    b890 - block
    b710 - block
    b249 - block
    b348 - block
    b161 - block
    b262 - block
    b964 - block
    b713 - block
    b486 - block
    b226 - block
    b893 - block
    b450 - block
    b227 - block
    b719 - block
    b532 - block
    b163 - block
    b549 - block
    b339 - block
    b842 - block
    b256 - block
    b946 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b613 )
    ( on b514 b613 )
    ( on b673 b514 )
    ( on b463 b673 )
    ( on b662 b463 )
    ( on b612 b662 )
    ( on b275 b612 )
    ( on b877 b275 )
    ( on b357 b877 )
    ( on b679 b357 )
    ( on b890 b679 )
    ( on b710 b890 )
    ( on b249 b710 )
    ( on b348 b249 )
    ( on b161 b348 )
    ( on b262 b161 )
    ( on b964 b262 )
    ( on b713 b964 )
    ( on b486 b713 )
    ( on b226 b486 )
    ( on b893 b226 )
    ( on b450 b893 )
    ( on b227 b450 )
    ( on b719 b227 )
    ( on b532 b719 )
    ( on b163 b532 )
    ( on b549 b163 )
    ( on b339 b549 )
    ( on b842 b339 )
    ( on b256 b842 )
    ( on b946 b256 )
    ( clear b946 )
  )
  ( :goal
    ( and
      ( clear b613 )
    )
  )
)
