( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b400 - block
    b337 - block
    b690 - block
    b884 - block
    b301 - block
    b267 - block
    b166 - block
    b104 - block
    b423 - block
    b749 - block
    b467 - block
    b454 - block
    b274 - block
    b758 - block
    b45 - block
    b894 - block
    b316 - block
    b373 - block
    b245 - block
    b925 - block
    b256 - block
    b623 - block
    b285 - block
    b602 - block
    b679 - block
    b900 - block
    b978 - block
    b968 - block
    b652 - block
    b548 - block
    b639 - block
    b495 - block
    b631 - block
    b192 - block
    b137 - block
    b171 - block
    b207 - block
    b990 - block
    b875 - block
    b101 - block
    b9 - block
    b739 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b400 )
    ( on b337 b400 )
    ( on b690 b337 )
    ( on b884 b690 )
    ( on b301 b884 )
    ( on b267 b301 )
    ( on b166 b267 )
    ( on b104 b166 )
    ( on b423 b104 )
    ( on b749 b423 )
    ( on b467 b749 )
    ( on b454 b467 )
    ( on b274 b454 )
    ( on b758 b274 )
    ( on b45 b758 )
    ( on b894 b45 )
    ( on b316 b894 )
    ( on b373 b316 )
    ( on b245 b373 )
    ( on b925 b245 )
    ( on b256 b925 )
    ( on b623 b256 )
    ( on b285 b623 )
    ( on b602 b285 )
    ( on b679 b602 )
    ( on b900 b679 )
    ( on b978 b900 )
    ( on b968 b978 )
    ( on b652 b968 )
    ( on b548 b652 )
    ( on b639 b548 )
    ( on b495 b639 )
    ( on b631 b495 )
    ( on b192 b631 )
    ( on b137 b192 )
    ( on b171 b137 )
    ( on b207 b171 )
    ( on b990 b207 )
    ( on b875 b990 )
    ( on b101 b875 )
    ( on b9 b101 )
    ( on b739 b9 )
    ( clear b739 )
  )
  ( :goal
    ( and
      ( clear b400 )
    )
  )
)
