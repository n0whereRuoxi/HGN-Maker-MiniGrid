( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b193 - block
    b408 - block
    b315 - block
    b860 - block
    b36 - block
    b534 - block
    b975 - block
    b143 - block
    b171 - block
    b414 - block
    b578 - block
    b982 - block
    b666 - block
    b903 - block
    b723 - block
    b577 - block
    b3 - block
    b457 - block
    b541 - block
    b701 - block
    b782 - block
    b476 - block
    b693 - block
    b741 - block
    b647 - block
    b162 - block
    b795 - block
    b500 - block
    b528 - block
    b812 - block
    b639 - block
    b208 - block
    b933 - block
    b42 - block
    b912 - block
    b887 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b193 )
    ( on b408 b193 )
    ( on b315 b408 )
    ( on b860 b315 )
    ( on b36 b860 )
    ( on b534 b36 )
    ( on b975 b534 )
    ( on b143 b975 )
    ( on b171 b143 )
    ( on b414 b171 )
    ( on b578 b414 )
    ( on b982 b578 )
    ( on b666 b982 )
    ( on b903 b666 )
    ( on b723 b903 )
    ( on b577 b723 )
    ( on b3 b577 )
    ( on b457 b3 )
    ( on b541 b457 )
    ( on b701 b541 )
    ( on b782 b701 )
    ( on b476 b782 )
    ( on b693 b476 )
    ( on b741 b693 )
    ( on b647 b741 )
    ( on b162 b647 )
    ( on b795 b162 )
    ( on b500 b795 )
    ( on b528 b500 )
    ( on b812 b528 )
    ( on b639 b812 )
    ( on b208 b639 )
    ( on b933 b208 )
    ( on b42 b933 )
    ( on b912 b42 )
    ( on b887 b912 )
    ( clear b887 )
  )
  ( :goal
    ( and
      ( clear b193 )
    )
  )
)
